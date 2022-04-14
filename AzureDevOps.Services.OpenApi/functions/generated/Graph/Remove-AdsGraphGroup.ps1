function Remove-AdsGraphGroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes an Azure DevOps group from all of its parent groups.

The group will still be visible, but membership
 checks for the group, and all descendants which derive membership through it, will return false.”

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER GroupDescriptor
    The descriptor of the group to delete.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsGraphGroup -Organization $organization -GroupDescriptor $groupdescriptor -ApiVersion $apiversion

    Removes an Azure DevOps group from all of its parent groups.

The group will still be visible, but membership
 checks for the group, and all descendants which derive membership through it, will return false.”

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
        $GroupDescriptor,

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
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/groups/{groupDescriptor}' -Replace '{organization}',$Organization -Replace '{groupDescriptor}',$GroupDescriptor

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}