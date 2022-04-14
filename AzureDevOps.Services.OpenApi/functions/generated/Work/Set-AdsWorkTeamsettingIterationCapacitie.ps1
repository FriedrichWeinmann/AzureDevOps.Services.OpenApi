function Set-AdsWorkTeamsettingIterationCapacitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update a team member's capacity

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
    PS C:\> Set-AdsWorkTeamsettingIterationCapacitie -Team $team -TeamMemberId $teammemberid -Project $project -Organization $organization -ApiVersion $apiversion -IterationId $iterationid

    Update a team member's capacity

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TeamMemberId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

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
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/teamsettings/iterations/{iterationId}/capacities/{teamMemberId}' -Replace '{team}',$Team -Replace '{teamMemberId}',$TeamMemberId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{iterationId}',$IterationId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}