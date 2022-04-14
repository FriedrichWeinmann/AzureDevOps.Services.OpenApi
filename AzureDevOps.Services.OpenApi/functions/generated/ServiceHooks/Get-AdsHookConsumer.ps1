function Get-AdsHookConsumer {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of available service hook consumer services. Optionally filter by consumers that support at least one event type from the specific publisher.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ConsumerId
    ID for a consumer.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PublisherId
    

.EXAMPLE
    PS C:\> Get-AdsHookConsumer -ApiVersion $apiversion -Organization $organization

    Get a list of available service hook consumer services. Optionally filter by consumers that support at least one event type from the specific publisher.

.EXAMPLE
    PS C:\> Get-AdsHookConsumer -ApiVersion $apiversion -ConsumerId $consumerid -Organization $organization

    Get a specific consumer service. Optionally filter out consumer actions that do not support any event types for the specified publisher.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get')]
        [string]
        $ConsumerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get')]
        [string]
        $PublisherId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'PublisherId' = 'publisherId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','PublisherId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/consumers' -Replace '{organization}',$Organization
        if ($ConsumerId) { $__path += "/$ConsumerId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}