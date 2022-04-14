function Get-AdsReleaseRelease {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of releases

.PARAMETER IsDeleted
    Gets the soft deleted releases, if true.

.PARAMETER Path
    Releases under this folder path will be returned

.PARAMETER QueryOrder
    Gets the results in the defined order of created date for releases. Default is descending.

.PARAMETER Top
    Number of releases to get. Default is 50.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER TagFilter
    A comma-delimited list of tags. Only releases with these tags will be returned.

.PARAMETER SourceBranchFilter
    Releases with given sourceBranchFilter will be returned.

.PARAMETER StatusFilter
    Releases that have this status.

.PARAMETER MinCreatedTime
    Releases that were created after this time.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DefinitionSnapshotRevision
    Definition snapshot revision number.

.PARAMETER ReleaseIdFilter
    A comma-delimited list of releases Ids. Only releases with these Ids will be returned.

.PARAMETER SourceId
    Unique identifier of the artifact used. e.g. For build it would be {projectGuid}:{BuildDefinitionId}, for Jenkins it would be {JenkinsConnectionId}:{JenkinsDefinitionId}, for TfsOnPrem it would be {TfsOnPremConnectionId}:{ProjectName}:{TfsOnPremDefinitionId}. For third-party artifacts e.g. TeamCity, BitBucket you may refer 'uniqueSourceIdentifier' inside vss-extension.json https://github.com/Microsoft/vsts-rm-extensions/blob/master/Extensions.

.PARAMETER DefinitionId
    Releases from this release definition Id.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.8' to use this version of the api.

.PARAMETER ContinuationToken
    Gets the releases after the continuation token provided.

.PARAMETER ArtifactTypeId
    Releases with given artifactTypeId will be returned. Values can be Build, Jenkins, GitHub, Nuget, Team Build (external), ExternalTFSBuild, Git, TFVC, ExternalTfsXamlBuild.

.PARAMETER Expand
    The property that should be expanded in the list of releases.

.PARAMETER SearchText
    Releases with names containing searchText.

.PARAMETER PropertyFilters
    A comma-delimited list of extended properties to be retrieved. If set, the returned Releases will contain values for the specified property Ids (if they exist). If not set, properties will not be included. Note that this will not filter out any Release from results irrespective of whether it has property set or not.

.PARAMETER MaxCreatedTime
    Releases that were created before this time.

.PARAMETER EnvironmentStatusFilter
    

.PARAMETER CreatedBy
    Releases created by this user.

.PARAMETER DefinitionEnvironmentId
    

.PARAMETER ArtifactVersionId
    Releases with given artifactVersionId will be returned. E.g. in case of Build artifactType, it is buildId.

.EXAMPLE
    PS C:\> Get-AdsReleaseRelease -ApiVersion $apiversion -DefinitionSnapshotRevision $definitionsnapshotrevision -Organization $organization -ReleaseId $releaseid -Project $project

    Get release for a given revision number.

.EXAMPLE
    PS C:\> Get-AdsReleaseRelease -ApiVersion $apiversion -Organization $organization -Project $project

    Get a list of releases

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $ReleaseId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TagFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceBranchFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinCreatedTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [int32]
        $DefinitionSnapshotRevision,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseIdFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Releases_Get Release Revision')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactTypeId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SearchText,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PropertyFilters,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxCreatedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $EnvironmentStatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatedBy,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionEnvironmentId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactVersionId
    )
    process {
        $__mapping = @{
            'IsDeleted' = 'isDeleted'
            'CreatedBy' = 'createdBy'
            'EnvironmentStatusFilter' = 'environmentStatusFilter'
            'MaxCreatedTime' = 'maxCreatedTime'
            'PropertyFilters' = 'propertyFilters'
            'SearchText' = 'searchText'
            'Expand' = '$expand'
            'ArtifactTypeId' = 'artifactTypeId'
            'ContinuationToken' = 'continuationToken'
            'ApiVersion' = 'api-version'
            'DefinitionId' = 'definitionId'
            'SourceId' = 'sourceId'
            'ReleaseIdFilter' = 'releaseIdFilter'
            'DefinitionSnapshotRevision' = 'definitionSnapshotRevision'
            'MinCreatedTime' = 'minCreatedTime'
            'StatusFilter' = 'statusFilter'
            'SourceBranchFilter' = 'sourceBranchFilter'
            'TagFilter' = 'tagFilter'
            'Top' = '$top'
            'QueryOrder' = 'queryOrder'
            'Path' = 'path'
            'DefinitionEnvironmentId' = 'definitionEnvironmentId'
            'ArtifactVersionId' = 'artifactVersionId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IsDeleted','CreatedBy','EnvironmentStatusFilter','MaxCreatedTime','PropertyFilters','SearchText','Expand','ArtifactTypeId','ContinuationToken','ApiVersion','DefinitionId','SourceId','ReleaseIdFilter','DefinitionSnapshotRevision','MinCreatedTime','StatusFilter','SourceBranchFilter','TagFilter','Top','QueryOrder','Path','DefinitionEnvironmentId','ArtifactVersionId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($ReleaseId) { $__path += "/$ReleaseId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}