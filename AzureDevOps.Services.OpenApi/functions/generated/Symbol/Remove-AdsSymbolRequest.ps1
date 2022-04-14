function Remove-AdsSymbolRequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a symbol request by request name.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RequestName
    The symbol request name.

.PARAMETER Synchronous
    If true, delete all the debug entries under this request synchronously in the current session. If false, the deletion will be postponed to a later point and be executed automatically by the system.

.PARAMETER RequestId
    The symbol request identifier.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsSymbolRequest -Organization $organization -RequestId $requestid -ApiVersion $apiversion

    Delete a symbol request by request identifier.

.EXAMPLE
    PS C:\> Remove-AdsSymbolRequest -Organization $organization -RequestName $requestname -ApiVersion $apiversion

    Delete a symbol request by request name.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [boolean]
        $Synchronous,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [string]
        $RequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'RequestName' = 'requestName'
            'Synchronous' = 'synchronous'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('RequestName','Synchronous','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://artifacts.dev.azure.com/{organization}/_apis/symbol/requests' -Replace '{organization}',$Organization
        if ($RequestId) { $__path += "/$RequestId" }

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}