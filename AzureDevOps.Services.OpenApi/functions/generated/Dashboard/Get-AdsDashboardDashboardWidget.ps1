function Get-AdsDashboardDashboardWidget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get widgets contained on the specified dashboard.

.PARAMETER WidgetId
    ID of the widget to read.

.PARAMETER DashboardId
    ID of the dashboard to read.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER ETag
    Dashboard Widgets Version

.PARAMETER Project
    Project ID or project name

.PARAMETER Team
    Team ID or team name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsDashboardDashboardWidget -WidgetId $widgetid -DashboardId $dashboardid -ApiVersion $apiversion -Project $project -Team $team -Organization $organization

    Get the current state of the specified widget.

.EXAMPLE
    PS C:\> Get-AdsDashboardDashboardWidget -DashboardId $dashboardid -ApiVersion $apiversion -Project $project -Team $team -Organization $organization

    Get widgets contained on the specified dashboard.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $WidgetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $DashboardId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ETag,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Get Widget')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'ETag' = 'eTag'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @('ETag') -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/dashboard/dashboards/{dashboardId}/widgets' -Replace '{dashboardId}',$DashboardId -Replace '{project}',$Project -Replace '{team}',$Team -Replace '{organization}',$Organization
        if ($WidgetId) { $__path += "/$WidgetId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}