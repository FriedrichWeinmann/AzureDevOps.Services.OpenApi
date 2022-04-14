﻿function New-AdsWorkTeamsettingIterationCapacitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Replace a team's capacity

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Team
    Team ID or team name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER IterationId
    ID of the iteration

.EXAMPLE
    PS C:\> New-AdsWorkTeamsettingIterationCapacitie -Organization $organization -Team $team -ApiVersion $apiversion -Project $project -IterationId $iterationid

    Replace a team's capacity

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IterationId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/teamsettings/iterations/{iterationId}/capacities' -Replace '{organization}',$Organization -Replace '{team}',$Team -Replace '{project}',$Project -Replace '{iterationId}',$IterationId

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}