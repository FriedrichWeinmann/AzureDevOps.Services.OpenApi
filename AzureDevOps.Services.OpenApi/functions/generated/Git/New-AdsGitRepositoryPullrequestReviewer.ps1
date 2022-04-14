function New-AdsGitRepositoryPullrequestReviewer {
<#
.SYNOPSIS
    

.DESCRIPTION
    Add an unmaterialized identity to the reviewers of a pull request.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReviewerId
    ID of the reviewer.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> New-AdsGitRepositoryPullrequestReviewer -PullRequestId $pullrequestid -Project $project -ReviewerId $reviewerid -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Add a reviewer to a pull request or cast a vote.

.EXAMPLE
    PS C:\> New-AdsGitRepositoryPullrequestReviewer -PullRequestId $pullrequestid -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Add an unmaterialized identity to the reviewers of a pull request.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Reviewers_Create Pull Request Reviewer')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Reviewers_Create Pull Request Reviewer')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Reviewers_Create Pull Request Reviewer')]
        [string]
        $ReviewerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Reviewers_Create Pull Request Reviewer')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Reviewers_Create Pull Request Reviewer')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Request Reviewers_Create Pull Request Reviewer')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/reviewers' -Replace '{pullRequestId}',$PullRequestId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId
        if ($ReviewerId) { $__path += "/$ReviewerId" }

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}