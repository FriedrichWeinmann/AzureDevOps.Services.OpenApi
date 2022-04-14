function Get-AdsTestSession {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test sessions

.PARAMETER IncludeOnlyCompletedSessions
    If true, it returns test sessions in completed state. Otherwise, it returns test sessions for all states

.PARAMETER Period
    Period in days from now, for which test sessions are fetched.

.PARAMETER AllSessions
    If false, returns test sessions for current user. Otherwise, it returns test sessions for all users

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Source
    Source of the test session.

.PARAMETER IncludeAllProperties
    If true, it returns all properties of the test sessions. Otherwise, it returns the skinny version.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Team
    Team ID or team name

.EXAMPLE
    PS C:\> Get-AdsTestSession -Project $project -Organization $organization -ApiVersion $apiversion -Team $team

    Get a list of test sessions

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeOnlyCompletedSessions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Period,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $AllSessions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Source,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllProperties,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team
    )
    process {
        $__mapping = @{
            'IncludeOnlyCompletedSessions' = 'includeOnlyCompletedSessions'
            'Period' = 'period'
            'AllSessions' = 'allSessions'
            'Source' = 'source'
            'IncludeAllProperties' = 'includeAllProperties'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeOnlyCompletedSessions','Period','AllSessions','Source','IncludeAllProperties','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/test/session' -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{team}',$Team

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}