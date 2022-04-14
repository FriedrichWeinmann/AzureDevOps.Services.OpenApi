function Set-AdsGraphGroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create a new Azure DevOps group or materialize an existing AAD group.

The body of the request must be a derived type of GraphGroupCreationContext:
  * GraphGroupVstsCreationContext - Create a new Azure DevOps group that is not backed by an external provider.
  * GraphGroupMailAddressCreationContext - Create a new group using the mail address as a reference to an existing group from an external AD or AAD backed provider.
  * GraphGroupOriginIdCreationContext - Create a new group using the OriginID as a reference to a group from an external AD or AAD backed provider.

 Optionally, you can add the newly created group as a member of an existing Azure DevOps group and/or specify a custom storage key for the group.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ScopeDescriptor
    A descriptor referencing the scope (collection, project) in which the group should be created. If omitted, will be created in the scope of the enclosing account or organization. Valid only for VSTS groups.

.PARAMETER GroupDescriptors
    A comma separated list of descriptors referencing groups you want the graph group to join

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsGraphGroup -Organization $organization -ApiVersion $apiversion

    Create a new Azure DevOps group or materialize an existing AAD group.

The body of the request must be a derived type of GraphGroupCreationContext:
  * GraphGroupVstsCreationContext - Create a new Azure DevOps group that is not backed by an external provider.
  * GraphGroupMailAddressCreationContext - Create a new group using the mail address as a reference to an existing group from an external AD or AAD backed provider.
  * GraphGroupOriginIdCreationContext - Create a new group using the OriginID as a reference to a group from an external AD or AAD backed provider.

 Optionally, you can add the newly created group as a member of an existing Azure DevOps group and/or specify a custom storage key for the group.

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
        $ScopeDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupDescriptors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ScopeDescriptor' = 'scopeDescriptor'
            'GroupDescriptors' = 'groupDescriptors'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ScopeDescriptor','GroupDescriptors','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/groups' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}