function Remove-AdsGitRepositoryPullrequestLabel {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a label from the set of those assigned to the pull request.

.PARAMETER PullRequestId
    ID of the pull request.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProjectId
    Project ID or project name.

.PARAMETER Project
    Project ID or project name

.PARAMETER LabelIdOrName
    The name or ID of the label requested.

.PARAMETER RepositoryId
    The repository ID of the pull request’s target branch.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsGitRepositoryPullrequestLabel -PullRequestId $pullrequestid -Organization $organization -Project $project -LabelIdOrName $labelidorname -RepositoryId $repositoryid -ApiVersion $apiversion

    Removes a label from the set of those assigned to the pull request.

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
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProjectId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $LabelIdOrName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ProjectId' = 'projectId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ProjectId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/labels/{labelIdOrName}' -Replace '{pullRequestId}',$PullRequestId -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{labelIdOrName}',$LabelIdOrName -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}