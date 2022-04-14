function Set-AdsProjectTeam {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create a team in a team project.

Possible failure scenarios
Invalid project name/ID (project doesn't exist) 404
Invalid team name or description 400
Team already exists 400
Insufficient privileges 400

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProjectId
    The name or ID (GUID) of the team project in which to create the team.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsProjectTeam -Organization $organization -ProjectId $projectid -ApiVersion $apiversion

    Create a team in a team project.

Possible failure scenarios
Invalid project name/ID (project doesn't exist) 404
Invalid team name or description 400
Team already exists 400
Insufficient privileges 400

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
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/projects/{projectId}/teams' -Replace '{organization}',$Organization -Replace '{projectId}',$ProjectId

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}