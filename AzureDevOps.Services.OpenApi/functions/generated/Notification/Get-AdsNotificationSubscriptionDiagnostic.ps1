﻿function Get-AdsNotificationSubscriptionDiagnostic {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the diagnostics settings for a subscription.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SubscriptionId
    The id of the notifications subscription.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsNotificationSubscriptionDiagnostic -Organization $organization -SubscriptionId $subscriptionid -ApiVersion $apiversion

    Get the diagnostics settings for a subscription.

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
        $SubscriptionId,

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
        $__path = 'https://{service}.dev.azure.com/{organization}/_apis/notification/subscriptions/{subscriptionId}/diagnostics' -Replace '{organization}',$Organization -Replace '{subscriptionId}',$SubscriptionId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}