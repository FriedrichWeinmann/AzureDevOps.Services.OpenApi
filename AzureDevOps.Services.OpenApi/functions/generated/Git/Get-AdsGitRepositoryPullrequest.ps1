function Get-AdsGitRepositoryPullrequest {
<#
.SYNOPSIS
    Retrieve all pull requests matching a specified criteria.

.DESCRIPTION
    Retrieve all pull requests matching a specified criteria.

Please note that description field will be truncated up to 400 symbols in the result.

.PARAMETER Top
    The number of pull requests to retrieve.

.PARAMETER SearchRepositoryId
    If set, search for pull requests whose target branch is in this repository.

.PARAMETER Status
    If set, search for pull requests that are in this state. Defaults to Active if unset.

.PARAMETER Project
    Project ID or project name

.PARAMETER SourceRefName
    If set, search for pull requests from this branch.

.PARAMETER MaxCommentLength
    Not used.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Skip
    The number of pull requests to ignore. For example, to retrieve results 101-150, set top to 50 and skip to 100.

.PARAMETER IncludeWorkItemRefs
    If true, the pull request will be returned with the associated work item references.

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER PullRequestId
    The ID of the pull request to retrieve.

.PARAMETER CreatorId
    If set, search for pull requests that were created by this identity.

.PARAMETER IncludeCommits
    If true, the pull request will be returned with the associated commits.

.PARAMETER SourceRepositoryId
    If set, search for pull requests whose source branch is in this repository.

.PARAMETER TargetRefName
    If set, search for pull requests into this branch.

.PARAMETER ReviewerID
    If set, search for pull requests that have this identity as a reviewer.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequest -Organization $organization -Project $project -ApiVersion $apiversion -RepositoryId $repositoryid

    Retrieve all pull requests matching a specified criteria.

Please note that description field will be truncated up to 400 symbols in the result.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPullrequest -PullRequestId $pullrequestid -Organization $organization -Project $project -ApiVersion $apiversion -RepositoryId $repositoryid

    Retrieve a pull request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SearchRepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceRefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [int32]
        $MaxCommentLength,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [boolean]
        $IncludeWorkItemRefs,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [string]
        $PullRequestId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatorId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [boolean]
        $IncludeCommits,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceRepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetRefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReviewerID,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request')]
        [string]
        $RepositoryId
    )
    process {
        $__mapping = @{
            'Top' = '$top'
            'ReviewerID' = 'searchCriteria.reviewerId'
            'TargetRefName' = 'searchCriteria.targetRefName'
            'SourceRepositoryId' = 'searchCriteria.sourceRepositoryId'
            'IncludeCommits' = 'includeCommits'
            'CreatorId' = 'searchCriteria.creatorId'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'IncludeWorkItemRefs' = 'includeWorkItemRefs'
            'Skip' = '$skip'
            'MaxCommentLength' = 'maxCommentLength'
            'SourceRefName' = 'searchCriteria.sourceRefName'
            'Status' = 'searchCriteria.status'
            'SearchRepositoryId' = 'searchCriteria.repositoryId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Top','ReviewerID','TargetRefName','SourceRepositoryId','IncludeCommits','CreatorId','IncludeLinks','IncludeWorkItemRefs','Skip','MaxCommentLength','SourceRefName','Status','SearchRepositoryId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullrequests' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId
        if ($PullRequestId) { $__path += "/$PullRequestId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}