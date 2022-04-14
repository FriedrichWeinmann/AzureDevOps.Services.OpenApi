function New-AdsServiceendpointEndpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update the service endpoints.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER EndpointId
    Endpoint Id of the endpoint to update

.PARAMETER Operation
    operation type

.EXAMPLE
    PS C:\> New-AdsServiceendpointEndpoint -ApiVersion $apiversion -Organization $organization

    Update the service endpoints.

.EXAMPLE
    PS C:\> New-AdsServiceendpointEndpoint -ApiVersion $apiversion -Organization $organization -EndpointId $endpointid

    Update the service endpoint

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $EndpointId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Update Service Endpoint')]
        [string]
        $Operation
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Operation' = 'operation'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Operation') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/serviceendpoint/endpoints' -Replace '{organization}',$Organization
        if ($EndpointId) { $__path += "/$EndpointId" }
        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}