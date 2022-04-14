function Get-AdsDashboardDashboardWidget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get widgets contained on the specified dashboard.

.PARAMETER ETag
    Dashboard Widgets Version

.PARAMETER WidgetId
    ID of the widget to read.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DashboardId
    ID of the dashboard to read.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Team
    Team ID or team name

.EXAMPLE
    PS C:\> Get-AdsDashboardDashboardWidget

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsDashboardDashboardWidget -WidgetId $widgetid -Project $project -Organization $organization -DashboardId $dashboardid -ApiVersion $apiversion -Team $team

    Get the current state of the specified widget.

.EXAMPLE
    PS C:\> Get-AdsDashboardDashboardWidget -Project $project -Organization $organization -DashboardId $dashboardid -ApiVersion $apiversion -Team $team

    Get widgets contained on the specified dashboard.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $ETag,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $WidgetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $DashboardId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
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

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}