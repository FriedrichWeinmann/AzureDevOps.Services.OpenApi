function Get-AdsGitRepositoryBranchStatistics {
<#
.SYNOPSIS
    Retrieve statistics about all branches within a repository.

.DESCRIPTION
    Retrieve statistics about all branches within a repository.

.PARAMETER VersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryBranchStatistics -Organization $organization -Project $project -RepositoryId $repositoryid -ApiVersion $apiversion

    Retrieve statistics about all branches within a repository.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType
    )
    process {
        $__mapping = @{
            'VersionOptions' = 'baseVersionDescriptor.versionOptions'
            'Version' = 'baseVersionDescriptor.version'
            'ApiVersion' = 'api-version'
            'VersionType' = 'baseVersionDescriptor.versionType'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('VersionOptions','Version','ApiVersion','VersionType') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/stats/branches' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}