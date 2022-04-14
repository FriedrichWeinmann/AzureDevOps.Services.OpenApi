function Remove-AdsAccesscontrolentrie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Remove the specified ACEs from the ACL belonging to the specified token.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Token
    The token whose ACL should be modified.

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER Descriptors
    String containing a list of identity descriptors separated by ',' whose entries should be removed.

.EXAMPLE
    PS C:\> Remove-AdsAccesscontrolentrie -Organization $organization -ApiVersion $apiversion -SecurityNamespaceId $securitynamespaceid

    Remove the specified ACEs from the ACL belonging to the specified token.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Token,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SecurityNamespaceId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Descriptors
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Token' = 'token'
            'Descriptors' = 'descriptors'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Token','Descriptors') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/accesscontrolentries/{securityNamespaceId}' -Replace '{organization}',$Organization -Replace '{securityNamespaceId}',$SecurityNamespaceId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}