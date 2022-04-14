﻿function Remove-AdsGraphUser {
<#
.SYNOPSIS
    

.DESCRIPTION
    Disables a user.

The user will still be visible, but membership checks for the user will return false.”

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER UserDescriptor
    The descriptor of the user to delete.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Remove-AdsGraphUser -ApiVersion $apiversion -UserDescriptor $userdescriptor -Organization $organization

    Disables a user.

The user will still be visible, but membership checks for the user will return false.”

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $UserDescriptor,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/users/{userDescriptor}' -Replace '{userDescriptor}',$UserDescriptor -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}