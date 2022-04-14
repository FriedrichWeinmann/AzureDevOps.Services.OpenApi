function Set-AdsDashboardDashboardWidget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update the supplied widgets on the dashboard using supplied state. State of existing Widgets not passed in the widget list is preserved.

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
    PS C:\> Set-AdsDashboardDashboardWidget

    <insert description here>

.EXAMPLE
    PS C:\> Set-AdsDashboardDashboardWidget -WidgetId $widgetid -Project $project -Organization $organization -DashboardId $dashboardid -ApiVersion $apiversion -Team $team

    Perform a partial update of the specified widget.

.EXAMPLE
    PS C:\> Set-AdsDashboardDashboardWidget -Project $project -Organization $organization -DashboardId $dashboardid -ApiVersion $apiversion -Team $team

    Update the supplied widgets on the dashboard using supplied state. State of existing Widgets not passed in the widget list is preserved.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $ETag,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Update Widget')]
        [string]
        $WidgetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Update Widget')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Update Widget')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Update Widget')]
        [string]
        $DashboardId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Update Widget')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widgets_Update Widget')]
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

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}