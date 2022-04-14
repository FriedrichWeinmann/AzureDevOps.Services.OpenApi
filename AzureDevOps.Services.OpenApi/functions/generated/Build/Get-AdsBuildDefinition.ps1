function Get-AdsBuildDefinition {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of definitions.

.PARAMETER YamlFilename
    If specified, filters to YAML definitions that match the given filename. To use this filter includeAllProperties should be set to true

.PARAMETER RepositoryId
    A repository ID. If specified, filters to definitions that use this repository.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER ContinuationToken
    A continuation token, returned by a previous call to this method, that can be used to return the next set of definitions.

.PARAMETER NotBuiltAfter
    If specified, filters to definitions that do not have builds after this date.

.PARAMETER Path
    If specified, filters to definitions under this folder.

.PARAMETER QueryOrder
    Indicates the order in which definitions should be returned.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryType
    If specified, filters to definitions that have a repository of this type.

.PARAMETER Name
    If specified, filters to definitions whose names match this pattern.

.PARAMETER BuiltAfter
    If specified, filters to definitions that have builds after this date.

.PARAMETER IncludeLatestBuilds
    Indicates whether to return the latest and latest completed builds for this definition.

.PARAMETER Revision
    The revision number to retrieve. If this is not specified, the latest version will be returned.

.PARAMETER ProcessType
    If specified, filters to definitions with the given process type.

.PARAMETER PropertyFilters
    A comma-delimited list of properties to include in the results.

.PARAMETER Top
    The maximum number of definitions to return.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.PARAMETER IncludeAllProperties
    Indicates whether the full definitions should be returned. By default, shallow representations of the definitions are returned.

.PARAMETER DefinitionIds
    A comma-delimited list that specifies the IDs of definitions to retrieve.

.PARAMETER TaskIdFilter
    If specified, filters to definitions that use the specified task.

.PARAMETER MinMetricsTime
    If specified, indicates the date from which metrics should be included.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinition -ApiVersion $apiversion -Project $project -DefinitionId $definitionid -Organization $organization

    Gets a definition, optionally at a specific revision.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinition -ApiVersion $apiversion -Project $project -Organization $organization

    Gets a list of definitions.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $YamlFilename,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $NotBuiltAfter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuiltAfter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [boolean]
        $IncludeLatestBuilds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [int32]
        $Revision,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ProcessType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $PropertyFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllProperties,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskIdFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $MinMetricsTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'YamlFilename' = 'yamlFilename'
            'TaskIdFilter' = 'taskIdFilter'
            'DefinitionIds' = 'definitionIds'
            'IncludeAllProperties' = 'includeAllProperties'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
            'PropertyFilters' = 'propertyFilters'
            'ProcessType' = 'processType'
            'Revision' = 'revision'
            'IncludeLatestBuilds' = 'includeLatestBuilds'
            'BuiltAfter' = 'builtAfter'
            'Name' = 'name'
            'RepositoryType' = 'repositoryType'
            'QueryOrder' = 'queryOrder'
            'Path' = 'path'
            'NotBuiltAfter' = 'notBuiltAfter'
            'ContinuationToken' = 'continuationToken'
            'RepositoryId' = 'repositoryId'
            'MinMetricsTime' = 'minMetricsTime'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('YamlFilename','TaskIdFilter','DefinitionIds','IncludeAllProperties','ApiVersion','Top','PropertyFilters','ProcessType','Revision','IncludeLatestBuilds','BuiltAfter','Name','RepositoryType','QueryOrder','Path','NotBuiltAfter','ContinuationToken','RepositoryId','MinMetricsTime') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($DefinitionId) { $__path += "/$DefinitionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}