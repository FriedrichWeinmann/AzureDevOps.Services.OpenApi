function Get-AdsGitRepository {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve git repositories.

.PARAMETER IncludeHidden
    [optional] True to include hidden repositories. The default value is false.

.PARAMETER IncludeLinks
    [optional] True to include reference links. The default value is false.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER IncludeAllUrls
    [optional] True to include all remote URLs. The default value is false.

.EXAMPLE
    PS C:\> Get-AdsGitRepository -Project $project -ApiVersion $apiversion -Organization $organization -RepositoryId $repositoryid

    Retrieve a git repository.

.EXAMPLE
    PS C:\> Get-AdsGitRepository -Project $project -ApiVersion $apiversion -Organization $organization

    Retrieve git repositories.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeHidden,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Repositories_Get Repository')]
        [string]
        $RepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllUrls
    )
    process {
        $__mapping = @{
            'IncludeHidden' = 'includeHidden'
            'IncludeLinks' = 'includeLinks'
            'ApiVersion' = 'api-version'
            'IncludeAllUrls' = 'includeAllUrls'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeHidden','IncludeLinks','ApiVersion','IncludeAllUrls') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($RepositoryId) { $__path += "/$RepositoryId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}