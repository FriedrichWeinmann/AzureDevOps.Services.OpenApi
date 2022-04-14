function Set-AdsGitRepositoryPullrequestIterationStatuse {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create a pull request status on the iteration. This operation will have the same result as Create status on pull request with specified iteration ID in the request body.

The only required field for the status is `Context.Name` that uniquely identifies the status.
Note that `iterationId` in the request body is optional since `iterationId` can be specified in the URL.
A conflict between `iterationId` in the URL and `iterationId` in the request body will result in status code 400.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER IterationId
    ID of the pull request iteration.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    The repository ID of the pull request’s target branch.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsGitRepositoryPullrequestIterationStatuse -PullRequestId $pullrequestid -IterationId $iterationid -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Create a pull request status on the iteration. This operation will have the same result as Create status on pull request with specified iteration ID in the request body.

The only required field for the status is `Context.Name` that uniquely identifies the status.
Note that `iterationId` in the request body is optional since `iterationId` can be specified in the URL.
A conflict between `iterationId` in the URL and `iterationId` in the request body will result in status code 400.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IterationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/iterations/{iterationId}/statuses' -Replace '{pullRequestId}',$PullRequestId -Replace '{iterationId}',$IterationId -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}