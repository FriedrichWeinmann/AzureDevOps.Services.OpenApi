function Set-AdsAccesscontrollist {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create or update one or more access control lists. All data that currently exists for the ACLs supplied will be overwritten.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SecurityNamespaceId
    Security namespace identifier.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsAccesscontrollist -Organization $organization -SecurityNamespaceId $securitynamespaceid -ApiVersion $apiversion

    Create or update one or more access control lists. All data that currently exists for the ACLs supplied will be overwritten.

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
        $SecurityNamespaceId,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/accesscontrollists/{securityNamespaceId}' -Replace '{organization}',$Organization -Replace '{securityNamespaceId}',$SecurityNamespaceId

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}