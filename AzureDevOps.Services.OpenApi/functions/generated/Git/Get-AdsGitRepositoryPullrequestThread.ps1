function Get-AdsGitRepositoryPullrequestThread {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve all threads in a pull request.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER Iteration
    If specified, thread positions will be tracked using this iteration as the right side of the diff.

.PARAMETER BaseIteration
    If specified, thread positions will be tracked using this iteration as the left side of the diff.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ThreadId
    ID of the thread.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequestThread -PullRequestId $pullrequestid -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion -ThreadId $threadid

    Retrieve a thread in a pull request.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequestThread -PullRequestId $pullrequestid -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Retrieve all threads in a pull request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [string]
        $PullRequestId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [int32]
        $Iteration,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [int32]
        $BaseIteration,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Threads_Get')]
        [string]
        $ThreadId
    )
    process {
        $__mapping = @{
            'Iteration' = '$iteration'
            'BaseIteration' = '$baseIteration'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Iteration','BaseIteration','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/threads' -Replace '{pullRequestId}',$PullRequestId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId
        if ($ThreadId) { $__path += "/$ThreadId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}