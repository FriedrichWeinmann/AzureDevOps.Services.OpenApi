function Set-AdsGitRepositoryPullrequestStatuse {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create a pull request status.

The only required field for the status is `Context.Name` that uniquely identifies the status.
Note that you can specify iterationId in the request body to post the status on the iteration.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER RepositoryId
    The repository ID of the pull request’s target branch.

.EXAMPLE
    PS C:\> Set-AdsGitRepositoryPullrequestStatuse -ApiVersion $apiversion -Project $project -Organization $organization -PullRequestId $pullrequestid -RepositoryId $repositoryid

    Create a pull request status.

The only required field for the status is `Context.Name` that uniquely identifies the status.
Note that you can specify iterationId in the request body to post the status on the iteration.

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
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/statuses' -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{pullRequestId}',$PullRequestId -Replace '{repositoryId}',$RepositoryId
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}