function Get-AdsWitWorkitemicon {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of all work item icons.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Color
    The 6-digit hex color for the icon

.PARAMETER Icon
    The name of the icon

.PARAMETER V
    The version of the icon (used only for cache invalidation)

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemicon -Organization $organization -Icon $icon -ApiVersion $apiversion

    Get a work item icon given the friendly name and icon color.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemicon -Organization $organization -ApiVersion $apiversion

    Get a list of all work item icons.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Icons_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Icons_Get')]
        [string]
        $Color,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Icons_Get')]
        [string]
        $Icon,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Icons_Get')]
        [int32]
        $V,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Icons_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Color' = 'color'
            'V' = 'v'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Color','V','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/wit/workitemicons' -Replace '{organization}',$Organization
        if ($Icon) { $__path += "/$Icon" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}