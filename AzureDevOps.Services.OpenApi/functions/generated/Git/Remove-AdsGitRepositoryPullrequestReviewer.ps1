function Remove-AdsGitRepositoryPullrequestReviewer {
<#
.SYNOPSIS
    

.DESCRIPTION
    Remove a reviewer from a pull request.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReviewerId
    ID of the reviewer to remove.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsGitRepositoryPullrequestReviewer -PullRequestId $pullrequestid -Project $project -ReviewerId $reviewerid -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Remove a reviewer from a pull request.

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
        $ReviewerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/reviewers/{reviewerId}' -Replace '{pullRequestId}',$PullRequestId -Replace '{project}',$Project -Replace '{reviewerId}',$ReviewerId -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}