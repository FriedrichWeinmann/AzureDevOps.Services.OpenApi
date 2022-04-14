function Get-AdsPermission {
<#
.SYNOPSIS
    

.DESCRIPTION
    Evaluates whether the caller has the specified permissions on the specified set of security tokens.

.PARAMETER Delimiter
    Optional security token separator. Defaults to ",".

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Permissions
    Permissions to evaluate.

.PARAMETER Tokens
    One or more security tokens to evaluate.

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER AlwaysAllowAdministrators
    If true and if the caller is an administrator, always return true.

.EXAMPLE
    PS C:\> Get-AdsPermission -ApiVersion $apiversion -Permissions $permissions -SecurityNamespaceId $securitynamespaceid -Organization $organization

    Evaluates whether the caller has the specified permissions on the specified set of security tokens.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Delimiter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Permissions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Tokens,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SecurityNamespaceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $AlwaysAllowAdministrators
    )
    process {
        $__mapping = @{
            'Delimiter' = 'delimiter'
            'ApiVersion' = 'api-version'
            'Tokens' = 'tokens'
            'AlwaysAllowAdministrators' = 'alwaysAllowAdministrators'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Delimiter','ApiVersion','Tokens','AlwaysAllowAdministrators') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/permissions/{securityNamespaceId}/{permissions}' -Replace '{permissions}',$Permissions -Replace '{securityNamespaceId}',$SecurityNamespaceId -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}