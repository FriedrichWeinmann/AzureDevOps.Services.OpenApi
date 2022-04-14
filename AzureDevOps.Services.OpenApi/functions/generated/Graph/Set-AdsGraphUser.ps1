function Set-AdsGraphUser {
<#
.SYNOPSIS
    

.DESCRIPTION
    Materialize an existing AAD or MSA user into the VSTS account.

NOTE: Created users are not active in an account unless they have been explicitly assigned a parent group at creation time or have signed in
  and been autolicensed through AAD group memberships.

 Adding a user to an account is required before the user can be added to VSTS groups or assigned an asset.

 The body of the request must be a derived type of GraphUserCreationContext:
  * GraphUserMailAddressCreationContext - Create a new user using the mail address as a reference to an existing user from an external AD or AAD backed provider.
  * GraphUserOriginIdCreationContext - Create a new user using the OriginID as a reference to an existing user from an external AD or AAD backed provider.
  * GraphUserPrincipalNameCreationContext - Create a new user using the principal name as a reference to an existing user from an external AD or AAD backed provider.

 If the user to be added corresponds to a user that was previously deleted, then that user will be restored.

 Optionally, you can add the newly created user as a member of an existing VSTS group and/or specify a custom storage key for the user.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER GroupDescriptors
    A comma separated list of descriptors of groups you want the graph user to join

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsGraphUser -Organization $organization -ApiVersion $apiversion

    Materialize an existing AAD or MSA user into the VSTS account.

NOTE: Created users are not active in an account unless they have been explicitly assigned a parent group at creation time or have signed in
  and been autolicensed through AAD group memberships.

 Adding a user to an account is required before the user can be added to VSTS groups or assigned an asset.

 The body of the request must be a derived type of GraphUserCreationContext:
  * GraphUserMailAddressCreationContext - Create a new user using the mail address as a reference to an existing user from an external AD or AAD backed provider.
  * GraphUserOriginIdCreationContext - Create a new user using the OriginID as a reference to an existing user from an external AD or AAD backed provider.
  * GraphUserPrincipalNameCreationContext - Create a new user using the principal name as a reference to an existing user from an external AD or AAD backed provider.

 If the user to be added corresponds to a user that was previously deleted, then that user will be restored.

 Optionally, you can add the newly created user as a member of an existing VSTS group and/or specify a custom storage key for the user.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupDescriptors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'GroupDescriptors' = 'groupDescriptors'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('GroupDescriptors','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/users' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}