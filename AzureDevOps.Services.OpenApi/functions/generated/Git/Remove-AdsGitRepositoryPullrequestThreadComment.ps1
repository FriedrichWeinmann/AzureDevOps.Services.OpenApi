﻿function Remove-AdsGitRepositoryPullrequestThreadComment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a comment associated with a specific thread in a pull request.

.PARAMETER CommentId
    ID of the comment.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ThreadId
    ID of the thread that the desired comment is in.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Remove-AdsGitRepositoryPullrequestThreadComment -CommentId $commentid -PullRequestId $pullrequestid -ApiVersion $apiversion -ThreadId $threadid -Project $project -RepositoryId $repositoryid -Organization $organization

    Delete a comment associated with a specific thread in a pull request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CommentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ThreadId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/threads/{threadId}/comments/{commentId}' -Replace '{commentId}',$CommentId -Replace '{pullRequestId}',$PullRequestId -Replace '{threadId}',$ThreadId -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}