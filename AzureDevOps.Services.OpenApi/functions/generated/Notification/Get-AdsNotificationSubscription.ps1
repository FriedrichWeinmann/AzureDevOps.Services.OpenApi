function Get-AdsNotificationSubscription {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of notification subscriptions, either by subscription IDs or by all subscriptions for a given user or group.

.PARAMETER Ids
    List of subscription IDs

.PARAMETER SubscriptionId
    

.PARAMETER TargetId
    User or Group ID

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER QueryFlags
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsNotificationSubscription -ApiVersion $apiversion -Organization $organization

    Get a list of notification subscriptions, either by subscription IDs or by all subscriptions for a given user or group.

.EXAMPLE
    PS C:\> Get-AdsNotificationSubscription -SubscriptionId $subscriptionid -ApiVersion $apiversion -Organization $organization

    Get a notification subscription by its ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Ids,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $SubscriptionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $QueryFlags,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Ids' = 'ids'
            'TargetId' = 'targetId'
            'ApiVersion' = 'api-version'
            'QueryFlags' = 'queryFlags'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Ids','TargetId','ApiVersion','QueryFlags') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://{service}.dev.azure.com/{organization}/_apis/notification/subscriptions' -Replace '{organization}',$Organization
        if ($SubscriptionId) { $__path += "/$SubscriptionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}