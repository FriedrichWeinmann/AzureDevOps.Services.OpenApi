function Get-AdsNotificationEventtype {
<#
.SYNOPSIS
    

.DESCRIPTION
    List available event types for this service. Optionally filter by only event types for the specified publisher.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER EventType
    The ID of the event type.

.PARAMETER PublisherId
    Limit to event types for this publisher

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsNotificationEventtype -Organization $organization -EventType $eventtype -ApiVersion $apiversion

    Get a specific event type.

.EXAMPLE
    PS C:\> Get-AdsNotificationEventtype -Organization $organization -ApiVersion $apiversion

    List available event types for this service. Optionally filter by only event types for the specified publisher.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Event Types_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Event Types_Get')]
        [string]
        $EventType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Event Types_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'PublisherId' = 'publisherId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PublisherId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://{service}.dev.azure.com/{organization}/_apis/notification/eventtypes' -Replace '{organization}',$Organization
        if ($EventType) { $__path += "/$EventType" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}