function Get-AdsGitRepositoryPullrequestThreadComment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve all comments associated with a specific thread in a pull request.

.PARAMETER ThreadId
    ID of the thread.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.PARAMETER CommentId
    ID of the comment.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequestThreadComment -ThreadId $threadid -PullRequestId $pullrequestid -Project $project -Organization $organization -RepositoryId $repositoryid -CommentId $commentid -ApiVersion $apiversion

    Retrieve a comment associated with a specific thread in a pull request.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequestThreadComment -ThreadId $threadid -PullRequestId $pullrequestid -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Retrieve all comments associated with a specific thread in a pull request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
        [string]
        $ThreadId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
        [string]
        $CommentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Thread Comments_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/threads/{threadId}/comments' -Replace '{threadId}',$ThreadId -Replace '{pullRequestId}',$PullRequestId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId
        if ($CommentId) { $__path += "/$CommentId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}