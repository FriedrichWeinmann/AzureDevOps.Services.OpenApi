function Get-AdsServiceendpointEndpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the service endpoints by name.

.PARAMETER IncludeDetails
    Flag to include more details for service endpoints. This is for internal use only and the flag will be treated as false for all other requests

.PARAMETER Type
    Type of the service endpoints.

.PARAMETER ActionFilter
    Action filter for the service connection. It specifies the action which can be performed on the service connection.

.PARAMETER IncludeFailed
    Failed flag for service endpoints.

.PARAMETER AuthSchemes
    Authorization schemes used for service endpoints.

.PARAMETER EndpointId
    Id of the service endpoint.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER EndpointNames
    Names of the service endpoints.

.PARAMETER Project
    Project ID or project name

.PARAMETER Owner
    Owner for service endpoints.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsServiceendpointEndpoint -ApiVersion $apiversion -EndpointNames $endpointnames -Project $project -Organization $organization

    Get the service endpoints by name.

.EXAMPLE
    PS C:\> Get-AdsServiceendpointEndpoint -EndpointId $endpointid -ApiVersion $apiversion -Project $project -Organization $organization

    Get the service endpoint details.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $ActionFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeFailed,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AuthSchemes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $EndpointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndpointNames,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeDetails' = 'includeDetails'
            'Type' = 'type'
            'ActionFilter' = 'actionFilter'
            'IncludeFailed' = 'includeFailed'
            'AuthSchemes' = 'authSchemes'
            'ApiVersion' = 'api-version'
            'EndpointNames' = 'endpointNames'
            'Owner' = 'owner'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeDetails','Type','ActionFilter','IncludeFailed','AuthSchemes','ApiVersion','EndpointNames','Owner') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/serviceendpoint/endpoints' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($EndpointId) { $__path += "/$EndpointId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}