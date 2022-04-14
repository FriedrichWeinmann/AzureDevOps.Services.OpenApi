function Get-AdsProjectTeam {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of teams.

.PARAMETER Mine
    If true return all the teams requesting user is member, otherwise return all the teams user has read access.

.PARAMETER Skip
    Number of teams to skip.

.PARAMETER TeamId
    The name or ID (GUID) of the team.

.PARAMETER ProjectId
    

.PARAMETER Top
    Maximum number of teams to return.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER ExpandIdentity
    A value indicating whether or not to expand Identity information in the result WebApiTeam object.

.EXAMPLE
    PS C:\> Get-AdsProjectTeam -TeamId $teamid -ProjectId $projectid -Organization $organization -ApiVersion $apiversion

    Get a specific team.

.EXAMPLE
    PS C:\> Get-AdsProjectTeam -ProjectId $projectid -Organization $organization -ApiVersion $apiversion

    Get a list of teams.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Mine,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $TeamId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $ProjectId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [boolean]
        $ExpandIdentity
    )
    process {
        $__mapping = @{
            'Mine' = '$mine'
            'Skip' = '$skip'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
            'ExpandIdentity' = '$expandIdentity'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Mine','Skip','Top','ApiVersion','ExpandIdentity') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/projects/{projectId}/teams' -Replace '{projectId}',$ProjectId -Replace '{organization}',$Organization
        if ($TeamId) { $__path += "/$TeamId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}