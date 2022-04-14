function Get-AdsGitRepository {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve git repositories.

.PARAMETER IncludeAllUrls
    [optional] True to include all remote URLs. The default value is false.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IncludeLinks
    [optional] True to include reference links. The default value is false.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER IncludeHidden
    [optional] True to include hidden repositories. The default value is false.

.EXAMPLE
    PS C:\> Get-AdsGitRepository -ApiVersion $apiversion -Organization $organization -Project $project

    Retrieve git repositories.

.EXAMPLE
    PS C:\> Get-AdsGitRepository -ApiVersion $apiversion -Organization $organization -Project $project -RepositoryId $repositoryid

    Retrieve a git repository.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllUrls,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $RepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeHidden
    )
    process {
        $__mapping = @{
            'IncludeAllUrls' = 'includeAllUrls'
            'ApiVersion' = 'api-version'
            'IncludeLinks' = 'includeLinks'
            'IncludeHidden' = 'includeHidden'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeAllUrls','ApiVersion','IncludeLinks','IncludeHidden') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($RepositoryId) { $__path += "/$RepositoryId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}