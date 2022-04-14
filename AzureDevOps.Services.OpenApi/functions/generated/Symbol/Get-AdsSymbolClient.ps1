function Get-AdsSymbolClient {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the client package.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ClientType
    Either "EXE" for a zip file containing a Windows symbol client (a.k.a. symbol.exe) along with dependencies, or "TASK" for a VSTS task that can be run on a VSTS build agent. All the other values are invalid. The parameter is case-insensitive.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSymbolClient -Organization $organization -ClientType $clienttype -ApiVersion $apiversion

    Get the client package.

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
        $ClientType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://artifacts.dev.azure.com/{organization}/_apis/symbol/client/{clientType}' -Replace '{organization}',$Organization -Replace '{clientType}',$ClientType

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}