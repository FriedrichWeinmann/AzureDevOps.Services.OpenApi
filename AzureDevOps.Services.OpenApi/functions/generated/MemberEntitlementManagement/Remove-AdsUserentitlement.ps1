function Remove-AdsUserEntitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a user from the account.

The delete operation includes unassigning Extensions and Licenses and removing the user from all project memberships.
The user would continue to have access to the account if she is member of an AAD group, that is added directly to the account.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER UserId
    ID of the user.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsUserEntitlement -Organization $organization -UserId $userid -ApiVersion $apiversion

    Delete a user from the account.

The delete operation includes unassigning Extensions and Licenses and removing the user from all project memberships.
The user would continue to have access to the account if she is member of an AAD group, that is added directly to the account.

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
        $UserId,

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
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/userentitlements/{userId}' -Replace '{organization}',$Organization -Replace '{userId}',$UserId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}