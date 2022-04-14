function Remove-AdsSymbolRequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a symbol request by request name.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RequestId
    The symbol request identifier.

.PARAMETER RequestName
    The symbol request name.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Synchronous
    If true, delete all the debug entries under this request synchronously in the current session. If false, the deletion will be postponed to a later point and be executed automatically by the system.

.EXAMPLE
    PS C:\> Remove-AdsSymbolRequest -ApiVersion $apiversion -RequestName $requestname -Organization $organization

    Delete a symbol request by request name.

.EXAMPLE
    PS C:\> Remove-AdsSymbolRequest -ApiVersion $apiversion -RequestId $requestid -Organization $organization

    Delete a symbol request by request identifier.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [string]
        $RequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Requests_Delete Requests Request Id')]
        [boolean]
        $Synchronous
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RequestName' = 'requestName'
            'Synchronous' = 'synchronous'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RequestName','Synchronous') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://artifacts.dev.azure.com/{organization}/_apis/symbol/requests' -Replace '{organization}',$Organization
        if ($RequestId) { $__path += "/$RequestId" }
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}