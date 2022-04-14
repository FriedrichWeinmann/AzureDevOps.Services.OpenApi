function Get-AdsOperation {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets an operation from the the operationId using the given pluginId.

Some scenarios don’t require a pluginId. If a pluginId is not included in the call then just the operationId will be used to find an operation.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER PluginId
    The ID for the plugin.

.PARAMETER OperationId
    The ID for the operation.

.EXAMPLE
    PS C:\> Get-AdsOperation -Organization $organization -ApiVersion $apiversion -OperationId $operationid

    Gets an operation from the the operationId using the given pluginId.

Some scenarios don’t require a pluginId. If a pluginId is not included in the call then just the operationId will be used to find an operation.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PluginId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OperationId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'PluginId' = 'pluginId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','PluginId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/operations/{operationId}' -Replace '{organization}',$Organization -Replace '{operationId}',$OperationId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}