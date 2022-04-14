function Set-AdsGitRepositoryPullrequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update a pull request

These are the properties that can be updated with the API:
 - Status
 - Title
 - Description (up to 4000 characters)
 - CompletionOptions
 - MergeOptions
 - AutoCompleteSetBy.Id
 - TargetRefName (when the PR retargeting feature is enabled)
 Attempting to update other properties outside of this list will either cause the server to throw an `InvalidArgumentValueException`,
 or to silently ignore the update.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PullRequestId
    ID of the pull request to update.

.PARAMETER RepositoryId
    The repository ID of the pull request's target branch.

.EXAMPLE
    PS C:\> Set-AdsGitRepositoryPullrequest -ApiVersion $apiversion -Project $project -Organization $organization -PullRequestId $pullrequestid -RepositoryId $repositoryid

    Update a pull request

These are the properties that can be updated with the API:
 - Status
 - Title
 - Description (up to 4000 characters)
 - CompletionOptions
 - MergeOptions
 - AutoCompleteSetBy.Id
 - TargetRefName (when the PR retargeting feature is enabled)
 Attempting to update other properties outside of this list will either cause the server to throw an `InvalidArgumentValueException`,
 or to silently ignore the update.

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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullrequests/{pullRequestId}' -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{pullRequestId}',$PullRequestId -Replace '{repositoryId}',$RepositoryId
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}