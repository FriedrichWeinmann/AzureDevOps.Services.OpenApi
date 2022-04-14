function Get-AdsHookSubscriptionNotification {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of notifications for a specific subscription. A notification includes details about the event, the request to and the response from the consumer service.

.PARAMETER SubscriptionId
    ID for a subscription.

.PARAMETER NotificationId
    

.PARAMETER Status
    Get only notifications with this status.

.PARAMETER Result
    Get only notifications with this result type.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER MaxResults
    Maximum number of notifications to return. Default is **100**.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsHookSubscriptionNotification -SubscriptionId $subscriptionid -NotificationId $notificationid -Organization $organization -ApiVersion $apiversion

    Get a specific notification for a subscription.

.EXAMPLE
    PS C:\> Get-AdsHookSubscriptionNotification -SubscriptionId $subscriptionid -Organization $organization -ApiVersion $apiversion

    Get a list of notifications for a specific subscription. A notification includes details about the event, the request to and the response from the consumer service.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $NotificationId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Result,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxResults,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Status' = 'status'
            'Result' = 'result'
            'MaxResults' = 'maxResults'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Status','Result','MaxResults','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/subscriptions/{subscriptionId}/notifications' -Replace '{subscriptionId}',$SubscriptionId -Replace '{organization}',$Organization
        if ($NotificationId) { $__path += "/$NotificationId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}