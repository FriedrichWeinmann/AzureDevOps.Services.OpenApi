function New-AdsWorkProcesseWorkitemtypeLayoutGroupControl {
<#
.SYNOPSIS
    

.DESCRIPTION
    Moves a control to a specified group.

.PARAMETER GroupId
    The ID of the group to move the control to.

.PARAMETER WitRefName
    The reference name of the work item type.

.PARAMETER ProcessId
    The ID of the process.

.PARAMETER ControlId
    The ID of the control.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RemoveFromGroupId
    The group ID to remove the control from.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> New-AdsWorkProcesseWorkitemtypeLayoutGroupControl -GroupId $groupid -WitRefName $witrefname -ProcessId $processid -ControlId $controlid -ApiVersion $apiversion -Organization $organization

    Moves a control to a specified group.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ControlId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RemoveFromGroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RemoveFromGroupId' = 'removeFromGroupId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RemoveFromGroupId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/layout/groups/{groupId}/controls/{controlId}' -Replace '{groupId}',$GroupId -Replace '{witRefName}',$WitRefName -Replace '{processId}',$ProcessId -Replace '{controlId}',$ControlId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}