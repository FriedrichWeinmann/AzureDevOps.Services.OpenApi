﻿function Get-AdsGitRepositoryPullrequestStatuse {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all the statuses associated with a pull request.

.PARAMETER StatusId
    ID of the pull request status.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    The repository ID of the pull request’s target branch.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequestStatuse -PullRequestId $pullrequestid -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Get all the statuses associated with a pull request.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequestStatuse -StatusId $statusid -PullRequestId $pullrequestid -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Get the specific pull request status by ID. The status ID is unique within the pull request across all iterations.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Statuses_Get')]
        [string]
        $StatusId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Statuses_Get')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Statuses_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Statuses_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Statuses_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Statuses_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/statuses' -Replace '{pullRequestId}',$PullRequestId -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        if ($StatusId) { $__path += "/$StatusId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}