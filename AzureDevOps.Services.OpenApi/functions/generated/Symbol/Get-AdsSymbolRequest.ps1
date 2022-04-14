function Get-AdsSymbolRequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a symbol request by request name.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RequestId
    The symbol request identifier.

.PARAMETER RequestName
    The symbol request name.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsSymbolRequest -ApiVersion $apiversion -RequestId $requestid -Organization $organization

    Get a symbol request by request identifier.

.EXAMPLE
    PS C:\> Get-AdsSymbolRequest -ApiVersion $apiversion -RequestName $requestname -Organization $organization

    Get a symbol request by request name.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Get Requests Request Id')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Get Requests Request Id')]
        [string]
        $RequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Get Requests Request Id')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RequestName' = 'requestName'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RequestName') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://artifacts.dev.azure.com/{organization}/_apis/symbol/requests' -Replace '{organization}',$Organization
        if ($RequestId) { $__path += "/$RequestId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}