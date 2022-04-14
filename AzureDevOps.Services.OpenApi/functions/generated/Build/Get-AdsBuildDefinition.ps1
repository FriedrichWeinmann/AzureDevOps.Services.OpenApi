function Get-AdsBuildDefinition {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of definitions.

.PARAMETER IncludeLatestBuilds
    Indicates whether to return the latest and latest completed builds for this definition.

.PARAMETER DefinitionIds
    A comma-delimited list that specifies the IDs of definitions to retrieve.

.PARAMETER QueryOrder
    Indicates the order in which definitions should be returned.

.PARAMETER Top
    The maximum number of definitions to return.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeAllProperties
    Indicates whether the full definitions should be returned. By default, shallow representations of the definitions are returned.

.PARAMETER MinMetricsTime
    If specified, indicates the date from which metrics should be included.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER RepositoryType
    If specified, filters to definitions that have a repository of this type.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER NotBuiltAfter
    If specified, filters to definitions that do not have builds after this date.

.PARAMETER PropertyFilters
    A comma-delimited list of properties to include in the results.

.PARAMETER YamlFilename
    If specified, filters to YAML definitions that match the given filename. To use this filter includeAllProperties should be set to true

.PARAMETER Path
    If specified, filters to definitions under this folder.

.PARAMETER ProcessType
    If specified, filters to definitions with the given process type.

.PARAMETER BuiltAfter
    If specified, filters to definitions that have builds after this date.

.PARAMETER Revision
    The revision number to retrieve. If this is not specified, the latest version will be returned.

.PARAMETER ContinuationToken
    A continuation token, returned by a previous call to this method, that can be used to return the next set of definitions.

.PARAMETER Name
    If specified, filters to definitions whose names match this pattern.

.PARAMETER TaskIdFilter
    If specified, filters to definitions that use the specified task.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.PARAMETER RepositoryId
    A repository ID. If specified, filters to definitions that use this repository.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinition -Organization $organization -Project $project -ApiVersion $apiversion

    Gets a list of definitions.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinition -Organization $organization -DefinitionId $definitionid -Project $project -ApiVersion $apiversion

    Gets a definition, optionally at a specific revision.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [boolean]
        $IncludeLatestBuilds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllProperties,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $MinMetricsTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $NotBuiltAfter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $PropertyFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $YamlFilename,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ProcessType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuiltAfter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [int32]
        $Revision,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskIdFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId
    )
    process {
        $__mapping = @{
            'IncludeLatestBuilds' = 'includeLatestBuilds'
            'TaskIdFilter' = 'taskIdFilter'
            'Name' = 'name'
            'ContinuationToken' = 'continuationToken'
            'Revision' = 'revision'
            'BuiltAfter' = 'builtAfter'
            'ProcessType' = 'processType'
            'Path' = 'path'
            'YamlFilename' = 'yamlFilename'
            'PropertyFilters' = 'propertyFilters'
            'NotBuiltAfter' = 'notBuiltAfter'
            'RepositoryType' = 'repositoryType'
            'MinMetricsTime' = 'minMetricsTime'
            'IncludeAllProperties' = 'includeAllProperties'
            'Top' = '$top'
            'QueryOrder' = 'queryOrder'
            'DefinitionIds' = 'definitionIds'
            'ApiVersion' = 'api-version'
            'RepositoryId' = 'repositoryId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeLatestBuilds','TaskIdFilter','Name','ContinuationToken','Revision','BuiltAfter','ProcessType','Path','YamlFilename','PropertyFilters','NotBuiltAfter','RepositoryType','MinMetricsTime','IncludeAllProperties','Top','QueryOrder','DefinitionIds','ApiVersion','RepositoryId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($DefinitionId) { $__path += "/$DefinitionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}