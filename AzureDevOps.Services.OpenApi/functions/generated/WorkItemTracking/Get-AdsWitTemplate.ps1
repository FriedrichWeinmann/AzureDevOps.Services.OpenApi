function Get-AdsWitTemplate {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets template

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TemplateId
    Template Id

.PARAMETER Project
    Project ID or project name

.PARAMETER Workitemtypename
    Optional, When specified returns templates for given Work item type.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Team
    Team ID or team name

.EXAMPLE
    PS C:\> Get-AdsWitTemplate -Organization $organization -TemplateId $templateid -Project $project -ApiVersion $apiversion -Team $team

    Gets the template with specified id

.EXAMPLE
    PS C:\> Get-AdsWitTemplate -Organization $organization -Project $project -ApiVersion $apiversion -Team $team

    Gets template

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $TemplateId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Workitemtypename,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $Team
    )
    process {
        $__mapping = @{
            'Workitemtypename' = 'workitemtypename'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Workitemtypename','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/wit/templates' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{team}',$Team
        if ($TemplateId) { $__path += "/$TemplateId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}