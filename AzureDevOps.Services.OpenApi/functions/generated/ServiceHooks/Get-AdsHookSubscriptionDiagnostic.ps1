﻿function Get-AdsHookSubscriptionDiagnostic {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER SubscriptionId
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsHookSubscriptionDiagnostic -ApiVersion $apiversion -SubscriptionId $subscriptionid -Organization $organization

    <insert description here>

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
        $SubscriptionId,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/subscriptions/{subscriptionId}/diagnostics' -Replace '{subscriptionId}',$SubscriptionId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}