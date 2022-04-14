function Get-AdsHookConsumerAction {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of consumer actions for a specific consumer.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ConsumerActionId
    ID for a consumerActionId.

.PARAMETER ConsumerId
    ID for a consumer.

.PARAMETER PublisherId
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsHookConsumerAction -Organization $organization -ConsumerActionId $consumeractionid -ConsumerId $consumerid -ApiVersion $apiversion

    Get details about a specific consumer action.

.EXAMPLE
    PS C:\> Get-AdsHookConsumerAction -Organization $organization -ConsumerId $consumerid -ApiVersion $apiversion

    Get a list of consumer actions for a specific consumer.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $ConsumerActionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $ConsumerId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $PublisherId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/consumers/{consumerId}/actions' -Replace '{organization}',$Organization -Replace '{consumerId}',$ConsumerId
        if ($ConsumerActionId) { $__path += "/$ConsumerActionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}