function Get-AdsTestSession {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test sessions

.PARAMETER Source
    Source of the test session.

.PARAMETER IncludeOnlyCompletedSessions
    If true, it returns test sessions in completed state. Otherwise, it returns test sessions for all states

.PARAMETER IncludeAllProperties
    If true, it returns all properties of the test sessions. Otherwise, it returns the skinny version.

.PARAMETER AllSessions
    If false, returns test sessions for current user. Otherwise, it returns test sessions for all users

.PARAMETER Period
    Period in days from now, for which test sessions are fetched.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER Team
    Team ID or team name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestSession -ApiVersion $apiversion -Project $project -Team $team -Organization $organization

    Get a list of test sessions

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Source,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeOnlyCompletedSessions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllProperties,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $AllSessions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Period,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Source' = 'source'
            'IncludeOnlyCompletedSessions' = 'includeOnlyCompletedSessions'
            'IncludeAllProperties' = 'includeAllProperties'
            'AllSessions' = 'allSessions'
            'Period' = 'period'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Source','IncludeOnlyCompletedSessions','IncludeAllProperties','AllSessions','Period','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/test/session' -Replace '{project}',$Project -Replace '{team}',$Team -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}