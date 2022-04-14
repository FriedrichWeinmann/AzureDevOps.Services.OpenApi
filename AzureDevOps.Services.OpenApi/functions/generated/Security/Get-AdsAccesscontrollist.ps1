function Get-AdsAccesscontrollist {
<#
.SYNOPSIS
    

.DESCRIPTION
    Return a list of access control lists for the specified security namespace and token. All ACLs in the security namespace will be retrieved if no optional parameters are provided.

.PARAMETER IncludeExtendedInfo
    If true, populate the extended information properties for the access control entries contained in the returned lists.

.PARAMETER Descriptors
    An optional filter string containing a list of identity descriptors separated by ',' whose ACEs should be retrieved. If this is left null, entire ACLs will be returned.

.PARAMETER Token
    Security token

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Recurse
    If true and this is a hierarchical namespace, return child ACLs of the specified token.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsAccesscontrollist -SecurityNamespaceId $securitynamespaceid -Organization $organization -ApiVersion $apiversion

    Return a list of access control lists for the specified security namespace and token. All ACLs in the security namespace will be retrieved if no optional parameters are provided.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeExtendedInfo,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Descriptors,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Token,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SecurityNamespaceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Recurse,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'IncludeExtendedInfo' = 'includeExtendedInfo'
            'Descriptors' = 'descriptors'
            'Token' = 'token'
            'Recurse' = 'recurse'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeExtendedInfo','Descriptors','Token','Recurse','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/accesscontrollists/{securityNamespaceId}' -Replace '{securityNamespaceId}',$SecurityNamespaceId -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}