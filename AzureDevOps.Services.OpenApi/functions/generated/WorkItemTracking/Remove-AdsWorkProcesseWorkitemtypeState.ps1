﻿function Remove-AdsWorkProcesseWorkitemtypeState {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a state definition in the work item type of the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ProcessId
    ID of the process

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER StateId
    ID of the state

.EXAMPLE
    PS C:\> Remove-AdsWorkProcesseWorkitemtypeState -Organization $organization -ApiVersion $apiversion -ProcessId $processid -WitRefName $witrefname -StateId $stateid

    Removes a state definition in the work item type of the process.

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StateId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/states/{stateId}' -Replace '{organization}',$Organization -Replace '{processId}',$ProcessId -Replace '{witRefName}',$WitRefName -Replace '{stateId}',$StateId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}