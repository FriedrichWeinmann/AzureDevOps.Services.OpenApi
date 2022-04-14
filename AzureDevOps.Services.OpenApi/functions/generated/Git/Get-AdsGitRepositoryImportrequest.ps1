﻿function Get-AdsGitRepositoryImportrequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve import requests for a repository.

.PARAMETER IncludeAbandoned
    True to include abandoned import requests in the results.

.PARAMETER ImportRequestId
    The unique identifier for the import request.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryImportrequest -ImportRequestId $importrequestid -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Retrieve a particular import request.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryImportrequest -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Retrieve import requests for a repository.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAbandoned,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Import Requests_Get')]
        [string]
        $ImportRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Import Requests_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Import Requests_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Import Requests_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Import Requests_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeAbandoned' = 'includeAbandoned'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeAbandoned','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/importRequests' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        if ($ImportRequestId) { $__path += "/$ImportRequestId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}