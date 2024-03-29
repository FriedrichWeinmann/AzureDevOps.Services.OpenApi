﻿function Get-AdsWorkBoard {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get boards

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Team
    Team ID or team name

.PARAMETER Id
    identifier for board, either board's backlog level name (Eg:"Stories") or Id

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWorkBoard -Organization $organization -Team $team -Id $id -Project $project -ApiVersion $apiversion

    Get board

.EXAMPLE
    PS C:\> Get-AdsWorkBoard -Organization $organization -Team $team -Project $project -ApiVersion $apiversion

    Get boards

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Boards_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Boards_Get')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Boards_Get')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Boards_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Boards_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards' -Replace '{organization}',$Organization -Replace '{team}',$Team -Replace '{project}',$Project
        if ($Id) { $__path += "/$Id" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}