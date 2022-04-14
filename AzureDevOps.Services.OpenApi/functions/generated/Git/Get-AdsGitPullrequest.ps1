function Get-AdsGitPullrequest {
<#
.SYNOPSIS
    Retrieve all pull requests matching a specified criteria.

.DESCRIPTION
    Retrieve all pull requests matching a specified criteria.

Please note that description field will be truncated up to 400 symbols in the result.

.PARAMETER Top
    The number of pull requests to retrieve.

.PARAMETER ReviewerID
    If set, search for pull requests that have this identity as a reviewer.

.PARAMETER TargetRefName
    If set, search for pull requests into this branch.

.PARAMETER SourceRepositoryId
    If set, search for pull requests whose source branch is in this repository.

.PARAMETER CreatorId
    If set, search for pull requests that were created by this identity.

.PARAMETER PullRequestId
    The ID of the pull request to retrieve.

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER Skip
    The number of pull requests to ignore. For example, to retrieve results 101-150, set top to 50 and skip to 100.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER MaxCommentLength
    Not used.

.PARAMETER SourceRefName
    If set, search for pull requests from this branch.

.PARAMETER Project
    Project ID or project name

.PARAMETER Status
    If set, search for pull requests that are in this state. Defaults to Active if unset.

.PARAMETER RepositoryId
    If set, search for pull requests whose target branch is in this repository.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitPullrequest -PullRequestId $pullrequestid -Organization $organization -Project $project -ApiVersion $apiversion

    Retrieve a pull request.

.EXAMPLE
    PS C:\> Get-AdsGitPullrequest -Organization $organization -Project $project -ApiVersion $apiversion

    Retrieve all pull requests matching a specified criteria.

Please note that description field will be truncated up to 400 symbols in the result.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReviewerID,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetRefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceRepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatorId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $PullRequestId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxCommentLength,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Top' = '$top'
            'ReviewerID' = 'searchCriteria.reviewerId'
            'TargetRefName' = 'searchCriteria.targetRefName'
            'SourceRepositoryId' = 'searchCriteria.sourceRepositoryId'
            'CreatorId' = 'searchCriteria.creatorId'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'Skip' = '$skip'
            'MaxCommentLength' = 'maxCommentLength'
            'SourceRefName' = 'searchCriteria.sourceRefName'
            'Status' = 'searchCriteria.status'
            'RepositoryId' = 'searchCriteria.repositoryId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Top','ReviewerID','TargetRefName','SourceRepositoryId','CreatorId','IncludeLinks','Skip','MaxCommentLength','SourceRefName','Status','RepositoryId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/pullrequests' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($PullRequestId) { $__path += "/$PullRequestId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}