function Get-AdsRepositoryFile {
	<#
	.SYNOPSIS
		Search an Azure DevOps repository for files.
	
	.DESCRIPTION
		Search an Azure DevOps repository for files.
		This does NOT use the search API but instead enumerates the entire content of each repository in each project of an organization.
		This will be fairly slow, but should work in all project/organization configurations.
	
	.PARAMETER Organization
		The organizations to search.
	
	.PARAMETER Project
		The projects to inspect.
		Defaults to '*'
	
	.PARAMETER Repository
		The repositories to inspect.
		Defaults to '*'
	
	.PARAMETER Branch
		The branches to look at.
		Defaults to '*'
	
	.PARAMETER Name
		A name filter to apply to all files.
		For example, set this to '*.ps1' to search all PowerShell script files.
		Defaults to '*'
	
	.PARAMETER IncludeContent
		Whether the actual file content should be included in the output
	
	.PARAMETER ApiVersion
		The API version to use for this request.
		Defaults to '6.0'
	
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
		$Repository = '*',

		[string[]]
		$Branch = '*',

		[string[]]
		$Name = '*',

		[switch]
		$IncludeContent,

		[string]
		$ApiVersion = '6.0'
	)

	begin {
		$apiParam = @{
			ApiVersion = $ApiVersion
		}
	}
	process {
		foreach ($orgName in $Organization) {
			$projects = Get-AdsProject @apiParam -Organization $orgName
			foreach ($projectItem in $projects) {
				if (Test-Overlap -Value $projectItem.Name -Filter $Project -Not) { continue }
				$projectParam = $apiParam.Clone() + @{
					Organization = $orgName
					Project      = $projectItem.id
				}
				
				try { $repositories = Get-AdsGitRepository @projectParam -ErrorAction Stop }
				catch {
					# Project doesn't have any repos
					if ($_.Exception.Response.StatusCode -eq 'NotFound') { continue }

					throw
				}

				foreach ($repositoryItem in $repositories) {
					if (Test-Overlap -Value $repositoryItem.Name -Filter $Repository -Not) { continue }

					$branches = Get-AdsGitRepositoryBranchStatistics @projectParam -RepositoryId $repositoryItem.id
					foreach ($branchItem in $branches) {
						if (Test-Overlap -Value $branchItem.Name -Filter $Branch -Not) { continue }

						$files = Get-AdsGitRepositoryItem @projectParam -RepositoryId $repositoryItem.id -RecursionLevel Full -IncludeContentMetadata $true -VersionType branch -Version $branchItem.name
						foreach ($fileItem in $files) {
							if ($fileItem.isFolder) { continue }
							$fileName = Split-Path -Path $fileItem.path -Leaf
							$folderPath = (Split-Path -Path $fileItem.path) -replace '\\', '/'
							if ($folderPath -notlike "*/") { $folderPath += "/" }
							if (Test-Overlap -Value $fileName -Filter $Name -Not) { continue }

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