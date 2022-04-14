function Set-AdsWitWorkitem {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates a single work item.

.PARAMETER Expand
    The expand parameters for work item attributes. Possible options are { None, Relations, Fields, Links, All }.

.PARAMETER SuppressNotifications
    Do not fire any notifications for this change

.PARAMETER ValidateOnly
    Indicate if you only want to validate the changes without saving the work item

.PARAMETER Id
    The id of the work item to update

.PARAMETER Project
    Project ID or project name

.PARAMETER BypassRules
    Do not enforce the work item type rules on this update

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsWitWorkitem -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Updates a single work item.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $SuppressNotifications,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ValidateOnly,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $BypassRules,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Expand' = '$expand'
            'SuppressNotifications' = 'suppressNotifications'
            'ValidateOnly' = 'validateOnly'
            'BypassRules' = 'bypassRules'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expand','SuppressNotifications','ValidateOnly','BypassRules','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workitems/{id}' -Replace '{id}',$Id -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}