function Get-AdsHookSubscriptionNotification {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of notifications for a specific subscription. A notification includes details about the event, the request to and the response from the consumer service.

.PARAMETER Result
    Get only notifications with this result type.

.PARAMETER Status
    Get only notifications with this status.

.PARAMETER MaxResults
    Maximum number of notifications to return. Default is **100**.

.PARAMETER NotificationId
    

.PARAMETER SubscriptionId
    ID for a subscription.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsHookSubscriptionNotification -SubscriptionId $subscriptionid -ApiVersion $apiversion -Organization $organization

    Get a list of notifications for a specific subscription. A notification includes details about the event, the request to and the response from the consumer service.

.EXAMPLE
    PS C:\> Get-AdsHookSubscriptionNotification -NotificationId $notificationid -SubscriptionId $subscriptionid -ApiVersion $apiversion -Organization $organization

    Get a specific notification for a subscription.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Result,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxResults,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $NotificationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $SubscriptionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Notifications_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Result' = 'result'
            'Status' = 'status'
            'MaxResults' = 'maxResults'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Result','Status','MaxResults','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/subscriptions/{subscriptionId}/notifications' -Replace '{subscriptionId}',$SubscriptionId -Replace '{organization}',$Organization
        if ($NotificationId) { $__path += "/$NotificationId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}