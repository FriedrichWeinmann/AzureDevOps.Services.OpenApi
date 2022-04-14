function Get-AdsBuildBuild {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of builds.

.PARAMETER BuildNumber
    If specified, filters to builds that match this build number. Append * to do a prefix search.

.PARAMETER QueryOrder
    The order in which builds should be returned.

.PARAMETER Top
    The maximum number of builds to return.

.PARAMETER Project
    Project ID or project name

.PARAMETER MaxBuildsPerDefinition
    The maximum number of builds to return per definition.

.PARAMETER PropertyFilters
    

.PARAMETER RepositoryType
    If specified, filters to builds that built from repositories of this type.

.PARAMETER StatusFilter
    If specified, filters to builds that match this status.

.PARAMETER BuildIds
    A comma-delimited list that specifies the IDs of builds to retrieve.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Queues
    A comma-delimited list of queue IDs. If specified, filters to builds that ran against these queues.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.PARAMETER DeletedFilter
    Indicates whether to exclude, include, or only return deleted builds.

.PARAMETER MaxTime
    If specified, filters to builds that finished/started/queued before this date based on the queryOrder specified.

.PARAMETER ContinuationToken
    A continuation token, returned by a previous call to this method, that can be used to return the next set of builds.

.PARAMETER RequestedFor
    If specified, filters to builds requested for the specified user.

.PARAMETER MinTime
    If specified, filters to builds that finished/started/queued after this date based on the queryOrder specified.

.PARAMETER ResultFilter
    If specified, filters to builds that match this result.

.PARAMETER Properties
    A comma-delimited list of properties to retrieve.

.PARAMETER ReasonFilter
    If specified, filters to builds that match this reason.

.PARAMETER TagFilters
    A comma-delimited list of tags. If specified, filters to builds that have the specified tags.

.PARAMETER BuildId
    

.PARAMETER BranchName
    If specified, filters to builds that built branches that built this branch.

.PARAMETER Definitions
    A comma-delimited list of definition IDs. If specified, filters to builds for these definitions.

.PARAMETER RepositoryId
    If specified, filters to builds that built from this repository.

.EXAMPLE
    PS C:\> Get-AdsBuildBuild -BuildId $buildid -Organization $organization -Project $project -ApiVersion $apiversion

    Gets a build

.EXAMPLE
    PS C:\> Get-AdsBuildBuild -Organization $organization -Project $project -ApiVersion $apiversion

    Gets a list of builds.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildNumber,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxBuildsPerDefinition,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $PropertyFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Queues,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DeletedFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestedFor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResultFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Properties,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReasonFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TagFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $BuildId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BranchName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Definitions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId
    )
    process {
        $__mapping = @{
            'BuildNumber' = 'buildNumber'
            'BranchName' = 'branchName'
            'TagFilters' = 'tagFilters'
            'ReasonFilter' = 'reasonFilter'
            'Properties' = 'properties'
            'ResultFilter' = 'resultFilter'
            'MinTime' = 'minTime'
            'RequestedFor' = 'requestedFor'
            'ContinuationToken' = 'continuationToken'
            'MaxTime' = 'maxTime'
            'Definitions' = 'definitions'
            'DeletedFilter' = 'deletedFilter'
            'Queues' = 'queues'
            'BuildIds' = 'buildIds'
            'StatusFilter' = 'statusFilter'
            'RepositoryType' = 'repositoryType'
            'PropertyFilters' = 'propertyFilters'
            'MaxBuildsPerDefinition' = 'maxBuildsPerDefinition'
            'Top' = '$top'
            'QueryOrder' = 'queryOrder'
            'ApiVersion' = 'api-version'
            'RepositoryId' = 'repositoryId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('BuildNumber','BranchName','TagFilters','ReasonFilter','Properties','ResultFilter','MinTime','RequestedFor','ContinuationToken','MaxTime','Definitions','DeletedFilter','Queues','BuildIds','StatusFilter','RepositoryType','PropertyFilters','MaxBuildsPerDefinition','Top','QueryOrder','ApiVersion','RepositoryId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/builds' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($BuildId) { $__path += "/$BuildId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}