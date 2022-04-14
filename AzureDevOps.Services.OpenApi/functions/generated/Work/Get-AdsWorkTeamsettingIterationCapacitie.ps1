function Get-AdsWorkTeamsettingIterationCapacitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a team's capacity including total capacity and days off

.PARAMETER Team
    Team ID or team name

.PARAMETER TeamMemberId
    ID of the team member

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER IterationId
    ID of the iteration

.EXAMPLE
    PS C:\> Get-AdsWorkTeamsettingIterationCapacitie -Team $team -TeamMemberId $teammemberid -Project $project -Organization $organization -ApiVersion $apiversion -IterationId $iterationid

    Get a team member's capacity

.EXAMPLE
    PS C:\> Get-AdsWorkTeamsettingIterationCapacitie -Team $team -Project $project -Organization $organization -ApiVersion $apiversion -IterationId $iterationid

    Get a team's capacity including total capacity and days off

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $TeamMemberId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/teamsettings/iterations/{iterationId}/capacities' -Replace '{team}',$Team -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{iterationId}',$IterationId
        if ($TeamMemberId) { $__path += "/$TeamMemberId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}