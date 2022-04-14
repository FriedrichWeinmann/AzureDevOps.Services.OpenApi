function Get-AdsWitWorkitemComment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of work item comments by ids.

.PARAMETER WorkItemId
    Id of a work item to get comments for.

.PARAMETER Expand
    Specifies the additional data retrieval options for work item comments.

.PARAMETER Ids
    Comma-separated list of comment ids to return.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeDeleted
    Specify if the deleted comments should be retrieved.

.PARAMETER CommentId
    Id of the comment to return.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemComment -WorkItemId $workitemid -Project $project -CommentId $commentid -ApiVersion $apiversion -Organization $organization

    Returns a work item comment.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemComment -WorkItemId $workitemid -Ids $ids -Project $project -ApiVersion $apiversion -Organization $organization

    Returns a list of work item comments by ids.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [string]
        $WorkItemId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Ids,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [boolean]
        $IncludeDeleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [string]
        $CommentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments_Get Comment')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Expand' = '$expand'
            'Ids' = 'ids'
            'IncludeDeleted' = 'includeDeleted'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expand','Ids','IncludeDeleted','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{workItemId}/comments' -Replace '{workItemId}',$WorkItemId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($CommentId) { $__path += "/$CommentId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}