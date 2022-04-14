function Get-AdsWorkTeamsettingIterationCapacitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a team's capacity including total capacity and days off

.PARAMETER TeamMemberId
    ID of the team member

.PARAMETER IterationId
    ID of the iteration

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER Team
    Team ID or team name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWorkTeamsettingIterationCapacitie -IterationId $iterationid -ApiVersion $apiversion -Project $project -Team $team -Organization $organization

    Get a team's capacity including total capacity and days off

.EXAMPLE
    PS C:\> Get-AdsWorkTeamsettingIterationCapacitie -TeamMemberId $teammemberid -IterationId $iterationid -ApiVersion $apiversion -Project $project -Team $team -Organization $organization

    Get a team member's capacity

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $TeamMemberId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $IterationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Capacities_Get Capacity With Identity Ref')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/teamsettings/iterations/{iterationId}/capacities' -Replace '{iterationId}',$IterationId -Replace '{project}',$Project -Replace '{team}',$Team -Replace '{organization}',$Organization
        if ($TeamMemberId) { $__path += "/$TeamMemberId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}