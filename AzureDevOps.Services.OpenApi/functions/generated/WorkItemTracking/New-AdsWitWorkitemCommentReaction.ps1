function New-AdsWitWorkitemCommentReaction {
<#
.SYNOPSIS
    

.DESCRIPTION
    Adds a new reaction to a comment.

.PARAMETER WorkItemId
    WorkItem ID

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER CommentId
    Comment ID

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ReactionType
    Type of the reaction

.EXAMPLE
    PS C:\> New-AdsWitWorkitemCommentReaction -WorkItemId $workitemid -Project $project -Organization $organization -CommentId $commentid -ApiVersion $apiversion -ReactionType $reactiontype

    Adds a new reaction to a comment.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WorkItemId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CommentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReactionType
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{workItemId}/comments/{commentId}/reactions/{reactionType}' -Replace '{workItemId}',$WorkItemId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{commentId}',$CommentId -Replace '{reactionType}',$ReactionType

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}