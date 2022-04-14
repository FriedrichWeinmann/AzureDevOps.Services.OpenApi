function New-AdsServiceendpointEndpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update the service endpoints.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Operation
    operation type

.PARAMETER EndpointId
    Endpoint Id of the endpoint to update

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.EXAMPLE
    PS C:\> New-AdsServiceendpointEndpoint -Organization $organization -EndpointId $endpointid -ApiVersion $apiversion

    Update the service endpoint

.EXAMPLE
    PS C:\> New-AdsServiceendpointEndpoint -Organization $organization -ApiVersion $apiversion

    Update the service endpoints.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $Operation,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $EndpointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Operation' = 'operation'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Operation','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/serviceendpoint/endpoints' -Replace '{organization}',$Organization
        if ($EndpointId) { $__path += "/$EndpointId" }

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}