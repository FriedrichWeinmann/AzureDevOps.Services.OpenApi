function Get-AdsGitFavoriteRef {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the refs favorites for a repo and an identity.

.PARAMETER IdentityId
    The id of the identity whose favorites are to be retrieved. If null, the requesting identity is used.

.PARAMETER FavoriteId
    The Id of the requested ref favorite.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    The id of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitFavoriteRef -ApiVersion $apiversion -Project $project -Organization $organization

    Gets the refs favorites for a repo and an identity.

.EXAMPLE
    PS C:\> Get-AdsGitFavoriteRef -FavoriteId $favoriteid -ApiVersion $apiversion -Project $project -Organization $organization

    Gets the refs favorite for a favorite Id.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IdentityId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $FavoriteId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Refs Favorites_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IdentityId' = 'identityId'
            'ApiVersion' = 'api-version'
            'RepositoryId' = 'repositoryId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IdentityId','ApiVersion','RepositoryId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/favorites/refs' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($FavoriteId) { $__path += "/$FavoriteId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}