function Get-AdsBuildBuild {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of builds.

.PARAMETER BranchName
    If specified, filters to builds that built branches that built this branch.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.PARAMETER MinTime
    If specified, filters to builds that finished/started/queued after this date based on the queryOrder specified.

.PARAMETER ReasonFilter
    If specified, filters to builds that match this reason.

.PARAMETER ContinuationToken
    A continuation token, returned by a previous call to this method, that can be used to return the next set of builds.

.PARAMETER Definitions
    A comma-delimited list of definition IDs. If specified, filters to builds for these definitions.

.PARAMETER ResultFilter
    If specified, filters to builds that match this result.

.PARAMETER Project
    Project ID or project name

.PARAMETER TagFilters
    A comma-delimited list of tags. If specified, filters to builds that have the specified tags.

.PARAMETER RepositoryType
    If specified, filters to builds that built from repositories of this type.

.PARAMETER QueryOrder
    The order in which builds should be returned.

.PARAMETER BuildIds
    A comma-delimited list that specifies the IDs of builds to retrieve.

.PARAMETER Properties
    A comma-delimited list of properties to retrieve.

.PARAMETER DeletedFilter
    Indicates whether to exclude, include, or only return deleted builds.

.PARAMETER PropertyFilters
    

.PARAMETER BuildNumber
    If specified, filters to builds that match this build number. Append * to do a prefix search.

.PARAMETER Top
    The maximum number of builds to return.

.PARAMETER MaxBuildsPerDefinition
    The maximum number of builds to return per definition.

.PARAMETER BuildId
    

.PARAMETER RepositoryId
    If specified, filters to builds that built from this repository.

.PARAMETER RequestedFor
    If specified, filters to builds requested for the specified user.

.PARAMETER StatusFilter
    If specified, filters to builds that match this status.

.PARAMETER MaxTime
    If specified, filters to builds that finished/started/queued before this date based on the queryOrder specified.

.PARAMETER Queues
    A comma-delimited list of queue IDs. If specified, filters to builds that ran against these queues.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsBuildBuild -Project $project -ApiVersion $apiversion -Organization $organization

    Gets a list of builds.

.EXAMPLE
    PS C:\> Get-AdsBuildBuild -BuildId $buildid -Project $project -ApiVersion $apiversion -Organization $organization

    Gets a build

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BranchName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReasonFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Definitions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResultFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TagFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Properties,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DeletedFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $PropertyFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildNumber,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxBuildsPerDefinition,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $BuildId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestedFor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Queues,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'BranchName' = 'branchName'
            'MaxTime' = 'maxTime'
            'StatusFilter' = 'statusFilter'
            'RequestedFor' = 'requestedFor'
            'RepositoryId' = 'repositoryId'
            'MaxBuildsPerDefinition' = 'maxBuildsPerDefinition'
            'Top' = '$top'
            'BuildNumber' = 'buildNumber'
            'PropertyFilters' = 'propertyFilters'
            'DeletedFilter' = 'deletedFilter'
            'Queues' = 'queues'
            'Properties' = 'properties'
            'QueryOrder' = 'queryOrder'
            'RepositoryType' = 'repositoryType'
            'TagFilters' = 'tagFilters'
            'ResultFilter' = 'resultFilter'
            'Definitions' = 'definitions'
            'ContinuationToken' = 'continuationToken'
            'ReasonFilter' = 'reasonFilter'
            'MinTime' = 'minTime'
            'ApiVersion' = 'api-version'
            'BuildIds' = 'buildIds'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('BranchName','MaxTime','StatusFilter','RequestedFor','RepositoryId','MaxBuildsPerDefinition','Top','BuildNumber','PropertyFilters','DeletedFilter','Queues','Properties','QueryOrder','RepositoryType','TagFilters','ResultFilter','Definitions','ContinuationToken','ReasonFilter','MinTime','ApiVersion','BuildIds') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/builds' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($BuildId) { $__path += "/$BuildId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}