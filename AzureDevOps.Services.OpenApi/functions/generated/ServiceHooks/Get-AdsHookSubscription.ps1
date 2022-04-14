function Get-AdsHookSubscription {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of subscriptions.

.PARAMETER PublisherId
    ID for a subscription.

.PARAMETER ConsumerId
    ID for a consumer.

.PARAMETER SubscriptionId
    ID for a subscription.

.PARAMETER ConsumerActionId
    ID for a consumerActionId.

.PARAMETER EventType
    The event type to filter on (if any).

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsHookSubscription -SubscriptionId $subscriptionid -Organization $organization -ApiVersion $apiversion

    Get a specific service hooks subscription.

.EXAMPLE
    PS C:\> Get-AdsHookSubscription -Organization $organization -ApiVersion $apiversion

    Get a list of subscriptions.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConsumerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $SubscriptionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConsumerActionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EventType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'PublisherId' = 'publisherId'
            'ConsumerId' = 'consumerId'
            'ConsumerActionId' = 'consumerActionId'
            'EventType' = 'eventType'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PublisherId','ConsumerId','ConsumerActionId','EventType','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/subscriptions' -Replace '{organization}',$Organization
        if ($SubscriptionId) { $__path += "/$SubscriptionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}