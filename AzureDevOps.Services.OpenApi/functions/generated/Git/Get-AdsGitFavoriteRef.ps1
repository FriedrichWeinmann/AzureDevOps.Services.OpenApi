function Get-AdsGitFavoriteRef {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the refs favorites for a repo and an identity.

.PARAMETER RepositoryId
    The id of the repository.

.PARAMETER FavoriteId
    The Id of the requested ref favorite.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IdentityId
    The id of the identity whose favorites are to be retrieved. If null, the requesting identity is used.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitFavoriteRef -FavoriteId $favoriteid -Project $project -Organization $organization -ApiVersion $apiversion

    Gets the refs favorite for a favorite Id.

.EXAMPLE
    PS C:\> Get-AdsGitFavoriteRef -Project $project -Organization $organization -ApiVersion $apiversion

    Gets the refs favorites for a repo and an identity.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $FavoriteId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IdentityId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'RepositoryId' = 'repositoryId'
            'IdentityId' = 'identityId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('RepositoryId','IdentityId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/favorites/refs' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($FavoriteId) { $__path += "/$FavoriteId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}