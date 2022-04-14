function Remove-AdsAccesscontrollist {
<#
.SYNOPSIS
    

.DESCRIPTION
    Remove access control lists under the specfied security namespace.

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Recurse
    If true and this is a hierarchical namespace, also remove child ACLs of the specified tokens.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Tokens
    One or more comma-separated security tokens

.EXAMPLE
    PS C:\> Remove-AdsAccesscontrollist -SecurityNamespaceId $securitynamespaceid -ApiVersion $apiversion -Organization $organization

    Remove access control lists under the specfied security namespace.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SecurityNamespaceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Recurse,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Tokens
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Recurse' = 'recurse'
            'Tokens' = 'tokens'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Recurse','Tokens') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/accesscontrollists/{securityNamespaceId}' -Replace '{securityNamespaceId}',$SecurityNamespaceId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}