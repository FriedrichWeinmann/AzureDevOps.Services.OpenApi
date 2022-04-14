function Get-AdsServiceendpointEndpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the service endpoints by name.

.PARAMETER Owner
    Owner for service endpoints.

.PARAMETER Type
    Type of the service endpoints.

.PARAMETER ActionFilter
    Action filter for the service connection. It specifies the action which can be performed on the service connection.

.PARAMETER EndpointNames
    Names of the service endpoints.

.PARAMETER EndpointId
    Id of the service endpoint.

.PARAMETER IncludeFailed
    Failed flag for service endpoints.

.PARAMETER IncludeDetails
    Flag to include more details for service endpoints. This is for internal use only and the flag will be treated as false for all other requests

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER AuthSchemes
    Authorization schemes used for service endpoints.

.EXAMPLE
    PS C:\> Get-AdsServiceendpointEndpoint -EndpointId $endpointid -Project $project -ApiVersion $apiversion -Organization $organization

    Get the service endpoint details.

.EXAMPLE
    PS C:\> Get-AdsServiceendpointEndpoint -EndpointNames $endpointnames -Project $project -ApiVersion $apiversion -Organization $organization

    Get the service endpoints by name.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $ActionFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndpointNames,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $EndpointId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeFailed,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Endpoints_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AuthSchemes
    )
    process {
        $__mapping = @{
            'Owner' = 'owner'
            'Type' = 'type'
            'ActionFilter' = 'actionFilter'
            'EndpointNames' = 'endpointNames'
            'IncludeFailed' = 'includeFailed'
            'IncludeDetails' = 'includeDetails'
            'ApiVersion' = 'api-version'
            'AuthSchemes' = 'authSchemes'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Owner','Type','ActionFilter','EndpointNames','IncludeFailed','IncludeDetails','ApiVersion','AuthSchemes') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/serviceendpoint/endpoints' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($EndpointId) { $__path += "/$EndpointId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}