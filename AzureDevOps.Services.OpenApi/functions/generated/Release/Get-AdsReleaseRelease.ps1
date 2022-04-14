function Get-AdsReleaseRelease {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of releases

.PARAMETER ArtifactVersionId
    Releases with given artifactVersionId will be returned. E.g. in case of Build artifactType, it is buildId.

.PARAMETER EnvironmentStatusFilter
    

.PARAMETER DefinitionId
    Releases from this release definition Id.

.PARAMETER MinCreatedTime
    Releases that were created after this time.

.PARAMETER Path
    Releases under this folder path will be returned

.PARAMETER QueryOrder
    Gets the results in the defined order of created date for releases. Default is descending.

.PARAMETER Expand
    The property that should be expanded in the list of releases.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER SourceId
    Unique identifier of the artifact used. e.g. For build it would be {projectGuid}:{BuildDefinitionId}, for Jenkins it would be {JenkinsConnectionId}:{JenkinsDefinitionId}, for TfsOnPrem it would be {TfsOnPremConnectionId}:{ProjectName}:{TfsOnPremDefinitionId}. For third-party artifacts e.g. TeamCity, BitBucket you may refer 'uniqueSourceIdentifier' inside vss-extension.json https://github.com/Microsoft/vsts-rm-extensions/blob/master/Extensions.

.PARAMETER DefinitionEnvironmentId
    

.PARAMETER SourceBranchFilter
    Releases with given sourceBranchFilter will be returned.

.PARAMETER TagFilter
    A comma-delimited list of tags. Only releases with these tags will be returned.

.PARAMETER ContinuationToken
    Gets the releases after the continuation token provided.

.PARAMETER DefinitionSnapshotRevision
    Definition snapshot revision number.

.PARAMETER IsDeleted
    Gets the soft deleted releases, if true.

.PARAMETER ReleaseIdFilter
    A comma-delimited list of releases Ids. Only releases with these Ids will be returned.

.PARAMETER SearchText
    Releases with names containing searchText.

.PARAMETER Top
    Number of releases to get. Default is 50.

.PARAMETER PropertyFilters
    A comma-delimited list of extended properties to be retrieved. If set, the returned Releases will contain values for the specified property Ids (if they exist). If not set, properties will not be included. Note that this will not filter out any Release from results irrespective of whether it has property set or not.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.8' to use this version of the api.

.PARAMETER ArtifactTypeId
    Releases with given artifactTypeId will be returned. Values can be Build, Jenkins, GitHub, Nuget, Team Build (external), ExternalTFSBuild, Git, TFVC, ExternalTfsXamlBuild.

.PARAMETER MaxCreatedTime
    Releases that were created before this time.

.PARAMETER StatusFilter
    Releases that have this status.

.PARAMETER CreatedBy
    Releases created by this user.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsReleaseRelease -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of releases

.EXAMPLE
    PS C:\> Get-AdsReleaseRelease -ApiVersion $apiversion -DefinitionSnapshotRevision $definitionsnapshotrevision -ReleaseId $releaseid -Project $project -Organization $organization

    Get release for a given revision number.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactVersionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $EnvironmentStatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinCreatedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $ReleaseId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionEnvironmentId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceBranchFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TagFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [int32]
        $DefinitionSnapshotRevision,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseIdFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SearchText,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PropertyFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactTypeId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxCreatedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatedBy,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ArtifactVersionId' = 'artifactVersionId'
            'StatusFilter' = 'statusFilter'
            'MaxCreatedTime' = 'maxCreatedTime'
            'ArtifactTypeId' = 'artifactTypeId'
            'ApiVersion' = 'api-version'
            'PropertyFilters' = 'propertyFilters'
            'Top' = '$top'
            'SearchText' = 'searchText'
            'ReleaseIdFilter' = 'releaseIdFilter'
            'IsDeleted' = 'isDeleted'
            'DefinitionSnapshotRevision' = 'definitionSnapshotRevision'
            'ContinuationToken' = 'continuationToken'
            'TagFilter' = 'tagFilter'
            'SourceBranchFilter' = 'sourceBranchFilter'
            'DefinitionEnvironmentId' = 'definitionEnvironmentId'
            'SourceId' = 'sourceId'
            'Expand' = '$expand'
            'QueryOrder' = 'queryOrder'
            'Path' = 'path'
            'MinCreatedTime' = 'minCreatedTime'
            'DefinitionId' = 'definitionId'
            'EnvironmentStatusFilter' = 'environmentStatusFilter'
            'CreatedBy' = 'createdBy'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ArtifactVersionId','StatusFilter','MaxCreatedTime','ArtifactTypeId','ApiVersion','PropertyFilters','Top','SearchText','ReleaseIdFilter','IsDeleted','DefinitionSnapshotRevision','ContinuationToken','TagFilter','SourceBranchFilter','DefinitionEnvironmentId','SourceId','Expand','QueryOrder','Path','MinCreatedTime','DefinitionId','EnvironmentStatusFilter','CreatedBy') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($ReleaseId) { $__path += "/$ReleaseId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}