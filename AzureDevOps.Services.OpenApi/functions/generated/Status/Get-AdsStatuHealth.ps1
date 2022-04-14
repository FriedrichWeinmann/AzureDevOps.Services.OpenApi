function Get-AdsStatuHealth {
<#
.SYNOPSIS
    

.DESCRIPTION
    Queries status information for the service all-up, or scoped to a particular service and/or geography

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Services
    A comma-separated list of services for which to get status information for. Supported values: Artifacts, Boards, Core services, Other services, Pipelines, Repos, Test Plans.

.PARAMETER Geographies
    A comma-separated list of geographies for which to get status information for. Supported values: APAC, AU, BR, CA, EU, IN, UK, US.

.EXAMPLE
    PS C:\> Get-AdsStatuHealth -ApiVersion $apiversion

    Queries status information for the service all-up, or scoped to a particular service and/or geography

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Services,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Geographies
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Services' = 'services'
            'Geographies' = 'geographies'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Services','Geographies') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://status.dev.azure.com/_apis/status/health'
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}