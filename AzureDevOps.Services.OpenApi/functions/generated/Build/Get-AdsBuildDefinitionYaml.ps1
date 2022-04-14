function Get-AdsBuildDefinitionYaml {
<#
.SYNOPSIS
    

.DESCRIPTION
    Converts a definition to YAML, optionally at a specific revision.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER MinMetricsTime
    If specified, indicates the date from which metrics should be included.

.PARAMETER Revision
    The revision number to retrieve. If this is not specified, the latest version will be returned.

.PARAMETER PropertyFilters
    A comma-delimited list of properties to include in the results.

.PARAMETER IncludeLatestBuilds
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinitionYaml -DefinitionId $definitionid -ApiVersion $apiversion -Project $project -Organization $organization

    Converts a definition to YAML, optionally at a specific revision.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinMetricsTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Revision,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PropertyFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLatestBuilds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'MinMetricsTime' = 'minMetricsTime'
            'Revision' = 'revision'
            'PropertyFilters' = 'propertyFilters'
            'IncludeLatestBuilds' = 'includeLatestBuilds'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','MinMetricsTime','Revision','PropertyFilters','IncludeLatestBuilds') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions/{definitionId}/yaml' -Replace '{definitionId}',$DefinitionId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}