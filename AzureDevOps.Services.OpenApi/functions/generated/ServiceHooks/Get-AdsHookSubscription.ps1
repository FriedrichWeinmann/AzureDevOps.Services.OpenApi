function Get-AdsHookSubscription {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of subscriptions.

.PARAMETER EventType
    The event type to filter on (if any).

.PARAMETER SubscriptionId
    ID for a subscription.

.PARAMETER ConsumerActionId
    ID for a consumerActionId.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER PublisherId
    ID for a subscription.

.PARAMETER ConsumerId
    ID for a consumer.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsHookSubscription -ApiVersion $apiversion -Organization $organization

    Get a list of subscriptions.

.EXAMPLE
    PS C:\> Get-AdsHookSubscription -SubscriptionId $subscriptionid -ApiVersion $apiversion -Organization $organization

    Get a specific service hooks subscription.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EventType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $SubscriptionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConsumerActionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConsumerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Subscriptions_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'EventType' = 'eventType'
            'ConsumerActionId' = 'consumerActionId'
            'ApiVersion' = 'api-version'
            'PublisherId' = 'publisherId'
            'ConsumerId' = 'consumerId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('EventType','ConsumerActionId','ApiVersion','PublisherId','ConsumerId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/subscriptions' -Replace '{organization}',$Organization
        if ($SubscriptionId) { $__path += "/$SubscriptionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}