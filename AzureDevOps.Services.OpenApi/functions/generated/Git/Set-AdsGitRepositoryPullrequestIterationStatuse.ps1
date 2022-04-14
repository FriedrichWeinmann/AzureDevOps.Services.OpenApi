function Set-AdsGitRepositoryPullrequestIterationStatuse {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update pull request iteration statuses collection. The only supported operation type is `remove`.

This operation allows to delete multiple statuses in one call.
The path of the `remove` operation should refer to the ID of the pull request status.
For example `path="/1"` refers to the pull request status with ID 1.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The repository ID of the pull request’s target branch.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IterationId
    ID of the pull request iteration.

.EXAMPLE
    PS C:\> Set-AdsGitRepositoryPullrequestIterationStatuse -PullRequestId $pullrequestid -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion -IterationId $iterationid

    Update pull request iteration statuses collection. The only supported operation type is `remove`.

This operation allows to delete multiple statuses in one call.
The path of the `remove` operation should refer to the ID of the pull request status.
For example `path="/1"` refers to the pull request status with ID 1.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IterationId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/iterations/{iterationId}/statuses' -Replace '{pullRequestId}',$PullRequestId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId -Replace '{iterationId}',$IterationId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}