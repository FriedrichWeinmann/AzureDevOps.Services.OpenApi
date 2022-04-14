﻿function Set-AdsWorkBoardCardrulesetting {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update board card Rule settings for the board id or board by name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Board
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Team
    Team ID or team name

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Set-AdsWorkBoardCardrulesetting -ApiVersion $apiversion -Board $board -Organization $organization -Team $team -Project $project

    Update board card Rule settings for the board id or board by name

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
        $Board,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards/{board}/cardrulesettings' -Replace '{board}',$Board -Replace '{organization}',$Organization -Replace '{team}',$Team -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}