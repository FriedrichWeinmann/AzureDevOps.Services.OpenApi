function Get-AdsHookConsumerAction {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of consumer actions for a specific consumer.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ConsumerId
    ID for a consumer.

.PARAMETER ConsumerActionId
    ID for a consumerActionId.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PublisherId
    

.EXAMPLE
    PS C:\> Get-AdsHookConsumerAction -ApiVersion $apiversion -ConsumerId $consumerid -Organization $organization

    Get a list of consumer actions for a specific consumer.

.EXAMPLE
    PS C:\> Get-AdsHookConsumerAction -ApiVersion $apiversion -ConsumerId $consumerid -ConsumerActionId $consumeractionid -Organization $organization

    Get details about a specific consumer action.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $ConsumerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $ConsumerActionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Consumers_Get Consumer Action')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/consumers/{consumerId}/actions' -Replace '{consumerId}',$ConsumerId -Replace '{organization}',$Organization
        if ($ConsumerActionId) { $__path += "/$ConsumerActionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}