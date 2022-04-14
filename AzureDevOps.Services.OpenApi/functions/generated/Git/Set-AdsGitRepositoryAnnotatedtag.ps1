﻿function Set-AdsGitRepositoryAnnotatedtag {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create an annotated tag.

Repositories have both a name and an identifier. Identifiers are globally unique, but several projects
may contain a repository of the same name. You don't need to include the project if you specify a
repository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID).

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RepositoryId
    ID or name of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Set-AdsGitRepositoryAnnotatedtag -ApiVersion $apiversion -RepositoryId $repositoryid -Organization $organization -Project $project

    Create an annotated tag.

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/annotatedtags' -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}