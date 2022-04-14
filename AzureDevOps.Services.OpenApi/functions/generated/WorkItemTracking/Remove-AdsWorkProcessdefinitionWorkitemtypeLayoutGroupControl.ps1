function Remove-AdsWorkProcessdefinitionWorkitemtypeLayoutGroupControl {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a control from the work item form

.PARAMETER GroupId
    The ID of the group

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ControlId
    The ID of the control to remove

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Remove-AdsWorkProcessdefinitionWorkitemtypeLayoutGroupControl -GroupId $groupid -WitRefName $witrefname -ProcessId $processid -ControlId $controlid -ApiVersion $apiversion -Organization $organization

    Removes a control from the work item form

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

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workItemTypes/{witRefName}/layout/groups/{groupId}/controls/{controlId}' -Replace '{groupId}',$GroupId -Replace '{witRefName}',$WitRefName -Replace '{processId}',$ProcessId -Replace '{controlId}',$ControlId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}