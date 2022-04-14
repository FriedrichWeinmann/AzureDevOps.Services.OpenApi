function Get-AdsWitWorkitemCommentReactionUser {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get users who reacted on the comment.

.PARAMETER WorkItemId
    WorkItem ID.

.PARAMETER Top
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Skip
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER CommentId
    Comment ID.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ReactionType
    Type of the reaction.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemCommentReactionUser -WorkItemId $workitemid -Project $project -Organization $organization -CommentId $commentid -ApiVersion $apiversion -ReactionType $reactiontype

    Get users who reacted on the comment.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WorkItemId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

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
            'Top' = '$top'
            'Skip' = '$skip'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Top','Skip','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{workItemId}/comments/{commentId}/reactions/{reactionType}/users' -Replace '{workItemId}',$WorkItemId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{commentId}',$CommentId -Replace '{reactionType}',$ReactionType

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}