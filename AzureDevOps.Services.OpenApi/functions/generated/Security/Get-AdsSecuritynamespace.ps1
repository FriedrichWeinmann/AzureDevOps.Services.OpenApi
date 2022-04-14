function Get-AdsSecuritynamespace {
<#
.SYNOPSIS
    

.DESCRIPTION
    List all security namespaces or just the specified namespace.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER LocalOnly
    If true, retrieve only local security namespaces.

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSecuritynamespace -Organization $organization -SecurityNamespaceId $securitynamespaceid -ApiVersion $apiversion

    List all security namespaces or just the specified namespace.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LocalOnly,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SecurityNamespaceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'LocalOnly' = 'localOnly'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('LocalOnly','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/securitynamespaces/{securityNamespaceId}' -Replace '{organization}',$Organization -Replace '{securityNamespaceId}',$SecurityNamespaceId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}