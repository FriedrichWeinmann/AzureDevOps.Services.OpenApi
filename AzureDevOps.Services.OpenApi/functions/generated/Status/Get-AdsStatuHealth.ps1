function Get-AdsStatuHealth {
<#
.SYNOPSIS
    

.DESCRIPTION
    Queries status information for the service all-up, or scoped to a particular service and/or geography

.PARAMETER Services
    A comma-separated list of services for which to get status information for. Supported values: Artifacts, Boards, Core services, Other services, Pipelines, Repos, Test Plans.

.PARAMETER Geographies
    A comma-separated list of geographies for which to get status information for. Supported values: APAC, AU, BR, CA, EU, IN, UK, US.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsStatuHealth -ApiVersion $apiversion

    Queries status information for the service all-up, or scoped to a particular service and/or geography

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Services,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Geographies,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Services' = 'services'
            'Geographies' = 'geographies'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Services','Geographies','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://status.dev.azure.com/_apis/status/health'

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}