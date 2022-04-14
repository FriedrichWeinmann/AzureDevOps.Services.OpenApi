function Get-AdsWitWorkitemCommentVersion {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER Version
    

.PARAMETER WorkItemId
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER CommentId
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemCommentVersion -Version $version -WorkItemId $workitemid -Project $project -Organization $organization -CommentId $commentid -ApiVersion $apiversion

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemCommentVersion -WorkItemId $workitemid -Project $project -Organization $organization -CommentId $commentid -ApiVersion $apiversion

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments Versions_Get')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments Versions_Get')]
        [string]
        $WorkItemId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments Versions_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments Versions_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments Versions_Get')]
        [string]
        $CommentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Comments Versions_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{workItemId}/comments/{commentId}/versions' -Replace '{workItemId}',$WorkItemId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{commentId}',$CommentId
        if ($Version) { $__path += "/$Version" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}