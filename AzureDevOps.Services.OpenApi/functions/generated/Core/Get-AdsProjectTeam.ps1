function Get-AdsProjectTeam {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of teams.

.PARAMETER TeamId
    The name or ID (GUID) of the team.

.PARAMETER ExpandIdentity
    A value indicating whether or not to expand Identity information in the result WebApiTeam object.

.PARAMETER Mine
    If true return all the teams requesting user is member, otherwise return all the teams user has read access.

.PARAMETER ProjectId
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Top
    Maximum number of teams to return.

.PARAMETER Skip
    Number of teams to skip.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsProjectTeam -TeamId $teamid -ProjectId $projectid -ApiVersion $apiversion -Organization $organization

    Get a specific team.

.EXAMPLE
    PS C:\> Get-AdsProjectTeam -ProjectId $projectid -ApiVersion $apiversion -Organization $organization

    Get a list of teams.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $TeamId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [boolean]
        $ExpandIdentity,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Mine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $ProjectId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Teams_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ExpandIdentity' = '$expandIdentity'
            'Mine' = '$mine'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
            'Skip' = '$skip'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ExpandIdentity','Mine','ApiVersion','Top','Skip') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/projects/{projectId}/teams' -Replace '{projectId}',$ProjectId -Replace '{organization}',$Organization
        if ($TeamId) { $__path += "/$TeamId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}