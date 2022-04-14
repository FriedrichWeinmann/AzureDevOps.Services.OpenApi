function Get-AdsBuildDefinitionYaml {
<#
.SYNOPSIS
    

.DESCRIPTION
    Converts a definition to YAML, optionally at a specific revision.

.PARAMETER PropertyFilters
    A comma-delimited list of properties to include in the results.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER IncludeLatestBuilds
    

.PARAMETER Project
    Project ID or project name

.PARAMETER MinMetricsTime
    If specified, indicates the date from which metrics should be included.

.PARAMETER Revision
    The revision number to retrieve. If this is not specified, the latest version will be returned.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinitionYaml -Organization $organization -DefinitionId $definitionid -Project $project -ApiVersion $apiversion

    Converts a definition to YAML, optionally at a specific revision.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PropertyFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLatestBuilds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinMetricsTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Revision,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'PropertyFilters' = 'propertyFilters'
            'IncludeLatestBuilds' = 'includeLatestBuilds'
            'MinMetricsTime' = 'minMetricsTime'
            'Revision' = 'revision'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PropertyFilters','IncludeLatestBuilds','MinMetricsTime','Revision','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions/{definitionId}/yaml' -Replace '{organization}',$Organization -Replace '{definitionId}',$DefinitionId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}