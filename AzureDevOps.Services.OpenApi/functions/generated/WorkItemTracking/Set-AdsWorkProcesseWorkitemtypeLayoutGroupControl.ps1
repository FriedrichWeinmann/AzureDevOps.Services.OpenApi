function Set-AdsWorkProcesseWorkitemtypeLayoutGroupControl {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates a control on the work item form.

.PARAMETER GroupId
    The ID of the group.

.PARAMETER ProcessId
    The ID of the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ControlId
    The ID of the control.

.PARAMETER WitRefName
    The reference name of the work item type.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsWorkProcesseWorkitemtypeLayoutGroupControl -GroupId $groupid -ProcessId $processid -Organization $organization -ControlId $controlid -WitRefName $witrefname -ApiVersion $apiversion

    Updates a control on the work item form.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ControlId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/layout/groups/{groupId}/controls/{controlId}' -Replace '{groupId}',$GroupId -Replace '{processId}',$ProcessId -Replace '{organization}',$Organization -Replace '{controlId}',$ControlId -Replace '{witRefName}',$WitRefName

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}