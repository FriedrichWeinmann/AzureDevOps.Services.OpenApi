﻿function New-AdsDashboardDashboard {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update the name and position of dashboards in the supplied group, and remove omitted dashboards. Does not modify dashboard content.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER DashboardId
    ID of the dashboard to replace.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Team
    Team ID or team name

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> New-AdsDashboardDashboard -ApiVersion $apiversion -Organization $organization -Team $team -Project $project

    Update the name and position of dashboards in the supplied group, and remove omitted dashboards. Does not modify dashboard content.

.EXAMPLE
    PS C:\> New-AdsDashboardDashboard -ApiVersion $apiversion -DashboardId $dashboardid -Organization $organization -Team $team -Project $project

    Replace configuration for the specified dashboard. Replaces Widget list on Dashboard, only if property is supplied.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $DashboardId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Dashboards_Replace Dashboard')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/dashboard/dashboards' -Replace '{organization}',$Organization -Replace '{team}',$Team -Replace '{project}',$Project
        if ($DashboardId) { $__path += "/$DashboardId" }
        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}