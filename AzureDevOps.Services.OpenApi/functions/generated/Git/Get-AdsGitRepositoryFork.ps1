function Get-AdsGitRepositoryFork {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve all forks of a repository in the collection.

.PARAMETER IncludeLinks
    True to include links.

.PARAMETER RepositoryNameOrId
    The name or ID of the repository.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER CollectionId
    Team project collection ID.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryFork -RepositoryNameOrId $repositorynameorid -Project $project -Organization $organization -ApiVersion $apiversion -CollectionId $collectionid

    Retrieve all forks of a repository in the collection.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryNameOrId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CollectionId
    )
    process {
        $__mapping = @{
            'IncludeLinks' = 'includeLinks'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeLinks','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryNameOrId}/forks/{collectionId}' -Replace '{repositoryNameOrId}',$RepositoryNameOrId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{collectionId}',$CollectionId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}