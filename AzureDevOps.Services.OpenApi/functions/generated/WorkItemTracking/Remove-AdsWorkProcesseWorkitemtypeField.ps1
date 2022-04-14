﻿function Remove-AdsWorkProcesseWorkitemtypeField {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a field from a work item type. Does not permanently delete the field.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER ProcessId
    The ID of the process.

.PARAMETER WitRefName
    The reference name of the work item type.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FieldRefName
    The reference name of the field.

.EXAMPLE
    PS C:\> Remove-AdsWorkProcesseWorkitemtypeField -ApiVersion $apiversion -ProcessId $processid -WitRefName $witrefname -Organization $organization -FieldRefName $fieldrefname

    Removes a field from a work item type. Does not permanently delete the field.

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
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FieldRefName
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/fields/{fieldRefName}' -Replace '{processId}',$ProcessId -Replace '{witRefName}',$WitRefName -Replace '{organization}',$Organization -Replace '{fieldRefName}',$FieldRefName
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}