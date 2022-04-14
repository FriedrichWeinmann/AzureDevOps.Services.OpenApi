﻿function Get-AdsSymbolRequestContent {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a stitched debug entry for a symbol request as specified by symbol request identifier and debug entry identifier.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DebugEntryId
    The debug entry identifier.

.PARAMETER RequestId
    The symbol request identifier.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSymbolRequestContent -Organization $organization -DebugEntryId $debugentryid -RequestId $requestid -ApiVersion $apiversion

    Get a stitched debug entry for a symbol request as specified by symbol request identifier and debug entry identifier.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DebugEntryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestId,

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
        $__path = 'https://artifacts.dev.azure.com/{organization}/_apis/symbol/requests/{requestId}/contents/{debugEntryId}' -Replace '{organization}',$Organization -Replace '{debugEntryId}',$DebugEntryId -Replace '{requestId}',$RequestId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}