function Get-AdsCltApmPlugin {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Type
    Currently ApplicationInsights is the only available plugin type.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsCltApmPlugin -Organization $organization -Type $type -ApiVersion $apiversion

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsCltApmPlugin -Organization $organization -ApiVersion $apiversion

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Plugins_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Plugins_Get')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Plugins_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/apm/plugins' -Replace '{organization}',$Organization
        if ($Type) { $__path += "/$Type" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}