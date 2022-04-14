function Get-AdsNotificationEventtype {
<#
.SYNOPSIS
    

.DESCRIPTION
    List available event types for this service. Optionally filter by only event types for the specified publisher.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PublisherId
    Limit to event types for this publisher

.PARAMETER EventType
    The ID of the event type.

.EXAMPLE
    PS C:\> Get-AdsNotificationEventtype -ApiVersion $apiversion -Organization $organization

    List available event types for this service. Optionally filter by only event types for the specified publisher.

.EXAMPLE
    PS C:\> Get-AdsNotificationEventtype -ApiVersion $apiversion -Organization $organization -EventType $eventtype

    Get a specific event type.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Event Types_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Event Types_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Event Types_Get')]
        [string]
        $EventType
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'PublisherId' = 'publisherId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','PublisherId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://{service}.dev.azure.com/{organization}/_apis/notification/eventtypes' -Replace '{organization}',$Organization
        if ($EventType) { $__path += "/$EventType" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}