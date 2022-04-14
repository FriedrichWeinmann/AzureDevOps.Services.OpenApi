function Get-AdsGroupEntitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the group entitlements for an account.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER GroupId
    ID of the group.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGroupEntitlement -Organization $organization -GroupId $groupid -ApiVersion $apiversion

    Get a group entitlement.

If the group entitlement does not exist, returns null.

.EXAMPLE
    PS C:\> Get-AdsGroupEntitlement -Organization $organization -ApiVersion $apiversion

    Get the group entitlements for an account.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Group Entitlements_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Group Entitlements_Get')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Group Entitlements_Get')]
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
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/groupentitlements' -Replace '{organization}',$Organization
        if ($GroupId) { $__path += "/$GroupId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}