function Get-AdsRepositoryFile {
	<#
	.SYNOPSIS
		Search an Azure DevOps repository for files.
	
	.DESCRIPTION
		Search an Azure DevOps repository for files.
		This does NOT use the search API but instead enumerates the entire content of each repository in each project of an organization.
		This will be fairly slow, but should work in all project/organization configurations.

		Scoped filters:
		Most include and exclude filters support scoping filters.
		The filter notation works like this:
		<Project>/<Repository>/<Branch>/<File>
		
		Example using "-ExcludeRepository":
		- "main"
		- "*/main"
		- "dev-*/sub-*"
		The first two inputs are equivalent, as not providing any segments automatically has the missing
		segments interpreted as "*".
		The third exclude filter will exclude all repositories starting with "sub-" so long as the project starts with "dev-".

		Example using "-Name":
		- "test.ps1": scan files named test.ps1 in any project, repository or branch.
		- "*/*/*/test.ps1": scan files named test.ps1 in any project, repository or branch.
		- "marigold/*/*/*.ps1"; Scan all PowerShell (ps1) files in any branch or repository of the marigold project

		Each filter parameter should have exactly ONE element or N elements in its filter, where N is:
		- Repository / ExcludeRepository: 2
		- Branch / ExcludeBranch: 3
		- Name / ExcludeName: 4
	
	.PARAMETER Organization
		The organizations to search.
	
	.PARAMETER Project
		The projects to inspect.
		Defaults to '*'

	.PARAMETER ExcludeProject
		Projects to explicitly NOT inspect.
	
	.PARAMETER Repository
		The repositories to inspect.
		Defaults to '*'
		Supports scoped filters (See description).

	.PARAMETER ExcludeRepository
		Repositories to explicitly NOT inspect.
		Supports scoped filters (See description).
	
	.PARAMETER Branch
		The branches to look at.
		Defaults to '*'
		Supports scoped filters (See description).

	.PARAMETER ExcludeBranch
		Branches to explicitly NOT inspect.
		Supports scoped filters (See description).
	
	.PARAMETER Name
		A name filter to apply to all files.
		For example, set this to '*.ps1' to search all PowerShell script files.
		Defaults to '*'
		Supports scoped filters (See description).

	.PARAMETER ExcludeName
		File names to NOT inspect.
		Supports scoped filters (See description).
	
	.PARAMETER IncludeContent
		Whether the actual file content should be included in the output
	
	.PARAMETER ApiVersion
		The API version to use for this request.
		Defaults to '6.0'

	.PARAMETER EnableException
		Replaces user friendly yellow warnings with bloody red exceptions of doom!
		Use this if you want the function to throw terminating errors you want to catch.
	
	.EXAMPLE
		PS C:\> Get-AdsRepositoryFile -Organization myOrg

		Returns all files in all branches of all repositories of all projects of myOrg
	
	.EXAMPLE
		PS C:\> Get-AdsRepositoryFile -Organization myOrg -Name *.ps1,*.psm1

		Returns all PowerShell script & module files in all branches of all repositories of all projects of myOrg

	.EXAMPLE
		PS C:\> Get-AdsRepositoryFile -Organization Contoso -Name *.ps1,*.psm1 -Project ContosoTools -Branch master

		Returns all PowerShell script & module files in the master branch of all repositories in the ContosoTools project under the Contoso organization.
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string[]]
		$Organization,

		[string[]]
		$Project = '*',
		
		[string[]]
		$ExcludeProject,

		[string[]]
		$Repository = '*',

		[string[]]
		$ExcludeRepository,

		[string[]]
		$Branch = '*',

		[string[]]
		$ExcludeBranch,

		[string[]]
		$Name = '*',

		[string[]]
		$ExcludeName,

		[switch]
		$IncludeContent,

		[string]
		$ApiVersion = '6.0',

		[switch]
		$EnableException
	)

	begin {
		#region Functions
		function ConvertTo-Filter {
			[CmdletBinding()]
			param (
				[Parameter(Mandatory = $true)]
				[ValidateSet('Repository', 'Branch', 'File')]
				[string]
				$Type,

				[Parameter(ValueFromPipeline = $true)]
				[string]
				$InputObject
			)

			process {
				if (-not $InputObject) { return }

				switch ($Type) {
					#region Repository
					'Repository' {
						if ($InputObject -notmatch '/') {
							[PSCustomObject]@{
								Project    = '*'
								Repository = $InputObject
							}
						}
						else {
							[PSCustomObject]@{
								Project    = $InputObject -replace '/.+$'
								Repository = $InputObject -replace '^.+?/'
							}
						}
					}
					#endregion Repository

					#region Branch
					'Branch' {
						if ($InputObject -notmatch '/.+/') {
							[PSCustomObject]@{
								Project    = '*'
								Repository = '*'
								Branch     = $InputObject
							}
						}
						else {
							[PSCustomObject]@{
								Project    = $InputObject -replace '/.+$'
								Repository = $InputObject -replace '^.+?/' -replace '/.+$'
								Branch     = $InputObject -replace '^.+/'
							}
						}
					}
					#endregion Branch

					#region File
					'File' {
						if ($InputObject -notmatch '/.+/.+/') {
							[PSCustomObject]@{
								Project    = '*'
								Repository = '*'
								Branch     = '*'
								File       = $InputObject
							}
						}
						else {
							[PSCustomObject]@{
								Project    = $InputObject -replace '/.+$'
								Repository = $InputObject -replace '^.+?/' -replace '/.+$'
								Branch     = $InputObject -replace '^.+/' -replace '^.+/' -replace '/.+$'
								File       = $InputObject -replace '^.+/'
							}
						}
					}
					#endregion File
				}
			}
		}

		function Select-Filter {
			[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSReviewUnusedParameter", "")]
			[CmdletBinding()]
			param (
				[Parameter(Mandatory = $true)]
				[hashtable]
				$Filters,

				[Parameter(Mandatory = $true, ParameterSetName = 'Project')]
				$Project,
				[Parameter(Mandatory = $true, ParameterSetName = 'Repository')]
				$Repository,
				[Parameter(Mandatory = $true, ParameterSetName = 'Branch')]
				$Branch
			)

			$newFilter = $Filters.Clone()
			$keys = $newFilter.Keys | Write-Output
			if ($Poject) {
				foreach ($key in $keys) {
					$newFilter.$key = $newFilter.$key | Where-Object { $Project -like $_.Project }
				}
			}
			if ($Repository) {
				foreach ($key in $keys) {
					$newFilter.$key = $newFilter.$key | Where-Object { $Repository -like $_.Repository }
				}
			}
			if ($Branch) {
				foreach ($key in $keys) {
					$newFilter.$key = $newFilter.$key | Where-Object { $Branch -like $_.Branch }
				}
			}
			$newFilter
		}
		#endregion Functions

		$apiParam = @{
			ApiVersion = $ApiVersion
		}

		$allFilters = @{
			RepoFilters = $Repository | ConvertTo-Filter -Type Repository
			RepoExcludeFilters = $ExcludeRepository | ConvertTo-Filter -Type Repository
	
			BranchFilters = $Branch | ConvertTo-Filter -Type Branch
			BranchExcludeFilters = $ExcludeBranch | ConvertTo-Filter -Type Branch
	
			FileFilters = $Name | ConvertTo-Filter -Type File
			FileExcludeFilters = $ExcludeName | ConvertTo-Filter -Type File
		}
	}
	process {
		foreach ($orgName in $Organization) {
			Write-PSFMessage -Message 'Processing Organization: {0}' -StringValues $orgName
			try { $projects = Get-AdsProject @apiParam -Organization $orgName -ErrorAction Stop }
			catch { Stop-PSFFunction -Message "Failed to retrieve projects from Organization $orgName" -ErrorRecord $_ -EnableException $EnableException -Continue }
			
			foreach ($projectItem in $projects) {
				if (Test-Overlap -Value $projectItem.Name -Filter $Project -Not) { continue }
				if (Test-Overlap -Value $projectItem.Name -Filter $ExcludeProject) { continue }
				$projectFilter = Select-Filter -Filters $allFilters -Project $projectItem.Name

				Write-PSFMessage -Message '  Processing Project: {0}' -StringValues $projectItem.Name
				$projectParam = $apiParam.Clone() + @{
					Organization = $orgName
					Project      = $projectItem.id
				}
				
				try { $repositories = Get-AdsGitRepository @projectParam -ErrorAction Stop }
				catch {
					# Project doesn't have any repos
					if ($_.Exception.Response.StatusCode -eq 'NotFound') { continue }

					Stop-PSFFunction -Message "Failed to retrieve repositories from project $($projectItem.id) from Organization $orgName" -ErrorRecord $_ -EnableException $EnableException -Continue -Target $projectItem
				}

				foreach ($repositoryItem in $repositories) {
					if (Test-Overlap -Value $repositoryItem.Name -Filter $projectFilter.RepoFilters.Repository -Not) { continue }
					if (Test-Overlap -Value $repositoryItem.Name -Filter $projectFilter.RepoExcludeFilters.Repository) { continue }
					$repositoryFilter = Select-Filter -Filters $projectFilter -Repository $repositoryItem.Name
					Write-PSFMessage -Level SomewhatVerbose -Message '    Scanning repository: {0}' -StringValues $repositoryItem.Name

					try { $branches = Get-AdsGitRepositoryBranchStatistics @projectParam -RepositoryId $repositoryItem.id -ErrorAction Stop }
					catch { Stop-PSFFunction -Message "Failed to retrieve branches from repository $($repositoryItem.id) of project $($projectItem.id) from Organization $orgName" -ErrorRecord $_ -EnableException $EnableException -Continue -Target $repositoryItem }
					foreach ($branchItem in $branches) {
						if (Test-Overlap -Value $branchItem.Name -Filter $repositoryFilter.BranchFilters.Branch -Not) { continue }
						if (Test-Overlap -Value $branchItem.Name -Filter $repositoryFilter.BranchExcludeFilters.Branch) { continue }
						$branchFilter = Select-Filter -Filters $repositoryFilter -Branch $branchItem.Name

						$files = Get-AdsGitRepositoryItem @projectParam -RepositoryId $repositoryItem.id -RecursionLevel Full -IncludeContentMetadata $true -VersionType branch -Version $branchItem.name
						foreach ($fileItem in $files) {
							if ($fileItem.isFolder) { continue }
							$fileName = Split-Path -Path $fileItem.path -Leaf
							$folderPath = (Split-Path -Path $fileItem.path) -replace '\\', '/'
							if ($folderPath -notlike "*/") { $folderPath += "/" }
							if (Test-Overlap -Value $fileName -Filter $branchFilter.FileFilters.File -Not) { continue }
							if (Test-Overlap -Value $fileName -Filter $branchFilter.FileExcludeFilters.File) { continue }

							$result = [PSCustomObject]@{
								PSTypeName     = 'AzureDevOps.Git.File'
								Name           = '{0}/{1}/{2}{3} [{4}]' -f $orgName, $projectItem.Name, $repositoryItem.name, $fileItem.path, $branchItem.Name
								FileName       = $fileName
								FilePath       = $fileItem.path
								FolderPath     = $folderPath
								Content        = ""
								Organization   = $orgName
								ProjectName    = $projectItem.name
								ProjectID      = $projectItem.id
								RepositoryName = $repositoryItem.name
								RepositoryID   = $repositoryItem.id
								Branch         = $branchItem.name
								url            = $fileItem.url
								FileID         = $fileItem.ObjectID
								CommitID       = $fileItem.commitId
							}
							if ($IncludeContent) {
								$result.Content = Get-AdsGitRepositoryItem @projectParam -RepositoryId $repositoryItem.id -Version $branchItem.name -ScopePath $fileItem.path
							}
							$result
						}
					}
				}
			}
		}
	}
}