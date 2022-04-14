function Remove-AdsPermission {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes the specified permissions on a security token for a user or group.

.PARAMETER Token
    Security token to remove permissions for.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Permissions
    Permissions to remove.

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Descriptor
    Identity descriptor of the user to remove permissions for.

.EXAMPLE
    PS C:\> Remove-AdsPermission -ApiVersion $apiversion -Permissions $permissions -SecurityNamespaceId $securitynamespaceid -Organization $organization -Descriptor $descriptor

    Removes the specified permissions on a security token for a user or group.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Token,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Permissions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SecurityNamespaceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Descriptor
    )
    process {
        $__mapping = @{
            'Token' = 'token'
            'ApiVersion' = 'api-version'
            'Descriptor' = 'descriptor'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Token','ApiVersion','Descriptor') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/permissions/{securityNamespaceId}/{permissions}' -Replace '{permissions}',$Permissions -Replace '{securityNamespaceId}',$SecurityNamespaceId -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}