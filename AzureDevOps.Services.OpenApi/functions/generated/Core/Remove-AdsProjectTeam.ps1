function Remove-AdsProjectTeam {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a team.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProjectId
    The name or ID (GUID) of the team project containing the team to delete.

.PARAMETER TeamId
    The name or ID of the team to delete.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsProjectTeam -Organization $organization -ProjectId $projectid -TeamId $teamid -ApiVersion $apiversion

    Delete a team.

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
        $ProjectId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TeamId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/projects/{projectId}/teams/{teamId}' -Replace '{organization}',$Organization -Replace '{projectId}',$ProjectId -Replace '{teamId}',$TeamId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}