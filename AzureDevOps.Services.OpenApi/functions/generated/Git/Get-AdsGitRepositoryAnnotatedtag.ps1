function Get-AdsGitRepositoryAnnotatedtag {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get an annotated tag.

Repositories have both a name and an identifier. Identifiers are globally unique, but several projects
may contain a repository of the same name. You don't need to include the project if you specify a
repository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID).

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ObjectId
    ObjectId (Sha1Id) of tag to get.

.PARAMETER RepositoryId
    ID or name of the repository.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryAnnotatedtag -Organization $organization -ObjectId $objectid -RepositoryId $repositoryid -Project $project -ApiVersion $apiversion

    Get an annotated tag.

Repositories have both a name and an identifier. Identifiers are globally unique, but several projects
may contain a repository of the same name. You don't need to include the project if you specify a
repository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID).

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ObjectId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/annotatedtags/{objectId}' -Replace '{organization}',$Organization -Replace '{objectId}',$ObjectId -Replace '{repositoryId}',$RepositoryId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}