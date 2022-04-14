function Set-AdsGitRepositoryPullrequestShare {
<#
.SYNOPSIS
    

.DESCRIPTION
    Sends an e-mail notification about a specific pull request to a set of recipients

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER RepositoryId
    ID of the git repository.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsGitRepositoryPullrequestShare -Organization $organization -Project $project -PullRequestId $pullrequestid -RepositoryId $repositoryid -ApiVersion $apiversion

    Sends an e-mail notification about a specific pull request to a set of recipients

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PullRequestId,

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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/share' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{pullRequestId}',$PullRequestId -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}