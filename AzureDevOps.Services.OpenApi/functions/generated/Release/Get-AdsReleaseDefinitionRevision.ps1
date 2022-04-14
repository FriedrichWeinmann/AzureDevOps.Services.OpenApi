function Get-AdsReleaseDefinitionRevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get revision history for a release definition

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DefinitionId
    Id of the definition.

.PARAMETER Revision
    Id of the revision.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsReleaseDefinitionRevision -Organization $organization -DefinitionId $definitionid -Revision $revision -Project $project -ApiVersion $apiversion

    Get release definition for a given definitionId and revision

.EXAMPLE
    PS C:\> Get-AdsReleaseDefinitionRevision -Organization $organization -DefinitionId $definitionid -Project $project -ApiVersion $apiversion

    Get revision history for a release definition

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get Definition Revision')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get Definition Revision')]
        [string]
        $DefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get Definition Revision')]
        [string]
        $Revision,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get Definition Revision')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get Definition Revision')]
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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/Release/definitions/{definitionId}/revisions' -Replace '{organization}',$Organization -Replace '{definitionId}',$DefinitionId -Replace '{project}',$Project
        if ($Revision) { $__path += "/$Revision" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}