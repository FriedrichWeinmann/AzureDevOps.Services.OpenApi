function New-AdsDashboardDashboardWidget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Replace the widgets on specified dashboard with the supplied widgets.

.PARAMETER ETag
    Dashboard Widgets Version

.PARAMETER WidgetId
    ID of the widget to update.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DashboardId
    ID of the Dashboard to modify.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Team
    Team ID or team name

.EXAMPLE
    PS C:\> New-AdsDashboardDashboardWidget

    <insert description here>

.EXAMPLE
    PS C:\> New-AdsDashboardDashboardWidget -WidgetId $widgetid -Project $project -Organization $organization -DashboardId $dashboardid -ApiVersion $apiversion -Team $team

    Override the  state of the specified widget.

.EXAMPLE
    PS C:\> New-AdsDashboardDashboardWidget -Project $project -Organization $organization -DashboardId $dashboardid -ApiVersion $apiversion -Team $team

    Replace the widgets on specified dashboard with the supplied widgets.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $ETag,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Replace Widget')]
        [string]
        $WidgetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Replace Widget')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Replace Widget')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Replace Widget')]
        [string]
        $DashboardId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Replace Widget')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Replace Widget')]
        [string]
        $Team
    )
    process {
        $__mapping = @{
            'ETag' = 'eTag'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @('ETag') -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/dashboard/dashboards/{dashboardId}/widgets' -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{dashboardId}',$DashboardId -Replace '{team}',$Team
        if ($WidgetId) { $__path += "/$WidgetId" }

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}