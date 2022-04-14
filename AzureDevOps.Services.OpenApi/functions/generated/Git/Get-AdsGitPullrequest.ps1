function Get-AdsGitPullrequest {
<#
.SYNOPSIS
    Retrieve all pull requests matching a specified criteria.

.DESCRIPTION
    Retrieve all pull requests matching a specified criteria.

Please note that description field will be truncated up to 400 symbols in the result.

.PARAMETER SourceRefName
    If set, search for pull requests from this branch.

.PARAMETER ReviewerID
    If set, search for pull requests that have this identity as a reviewer.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Top
    The number of pull requests to retrieve.

.PARAMETER Status
    If set, search for pull requests that are in this state. Defaults to Active if unset.

.PARAMETER TargetRefName
    If set, search for pull requests into this branch.

.PARAMETER Skip
    The number of pull requests to ignore. For example, to retrieve results 101-150, set top to 50 and skip to 100.

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER CreatorId
    If set, search for pull requests that were created by this identity.

.PARAMETER Project
    Project ID or project name

.PARAMETER MaxCommentLength
    Not used.

.PARAMETER SourceRepositoryId
    If set, search for pull requests whose source branch is in this repository.

.PARAMETER RepositoryId
    If set, search for pull requests whose target branch is in this repository.

.PARAMETER PullRequestId
    The ID of the pull request to retrieve.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitPullrequest -ApiVersion $apiversion -Project $project -PullRequestId $pullrequestid -Organization $organization

    Retrieve a pull request.

.EXAMPLE
    PS C:\> Get-AdsGitPullrequest -ApiVersion $apiversion -Project $project -Organization $organization

    Retrieve all pull requests matching a specified criteria.

Please note that description field will be truncated up to 400 symbols in the result.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceRefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReviewerID,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetRefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatorId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxCommentLength,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceRepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pull Requests_Get Pull Request By Id')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'SourceRefName' = 'searchCriteria.sourceRefName'
            'ReviewerID' = 'searchCriteria.reviewerId'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
            'Status' = 'searchCriteria.status'
            'TargetRefName' = 'searchCriteria.targetRefName'
            'Skip' = '$skip'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'CreatorId' = 'searchCriteria.creatorId'
            'MaxCommentLength' = 'maxCommentLength'
            'SourceRepositoryId' = 'searchCriteria.sourceRepositoryId'
            'RepositoryId' = 'searchCriteria.repositoryId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('SourceRefName','ReviewerID','ApiVersion','Top','Status','TargetRefName','Skip','IncludeLinks','CreatorId','MaxCommentLength','SourceRepositoryId','RepositoryId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/pullrequests' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($PullRequestId) { $__path += "/$PullRequestId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}