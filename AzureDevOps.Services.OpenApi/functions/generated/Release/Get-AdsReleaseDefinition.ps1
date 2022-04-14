function Get-AdsReleaseDefinition {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of release definitions.

.PARAMETER IsExactNameMatch
    'true'to gets the release definitions with exact match as specified in searchText. Default is 'false'.

.PARAMETER DefinitionId
    Id of the release definition.

.PARAMETER TagFilter
    A comma-delimited list of tags. Only release definitions with these tags will be returned.

.PARAMETER Path
    Gets the release definitions under the specified path.

.PARAMETER ContinuationToken
    Gets the release definitions after the continuation token provided.

.PARAMETER Expand
    The properties that should be expanded in the list of Release definitions.

.PARAMETER Project
    Project ID or project name

.PARAMETER QueryOrder
    Gets the results in the defined order. Default is 'IdAscending'.

.PARAMETER IsDeleted
    'true' to get release definitions that has been deleted. Default is 'false'

.PARAMETER SearchText
    Get release definitions with names containing searchText.

.PARAMETER Top
    Number of release definitions to get.

.PARAMETER PropertyFilters
    A comma-delimited list of extended properties to be retrieved. If set, the returned Release Definitions will contain values for the specified property Ids (if they exist). If not set, properties will not be included. Note that this will not filter out any Release Definition from results irrespective of whether it has property set or not.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER SearchTextContainsFolderName
    'true' to get the release definitions under the folder with name as specified in searchText. Default is 'false'.

.PARAMETER ArtifactSourceId
    Release definitions with given artifactSourceId will be returned. e.g. For build it would be {projectGuid}:{BuildDefinitionId}, for Jenkins it would be {JenkinsConnectionId}:{JenkinsDefinitionId}, for TfsOnPrem it would be {TfsOnPremConnectionId}:{ProjectName}:{TfsOnPremDefinitionId}. For third-party artifacts e.g. TeamCity, BitBucket you may refer 'uniqueSourceIdentifier' inside vss-extension.json at https://github.com/Microsoft/vsts-rm-extensions/blob/master/Extensions.

.PARAMETER DefinitionIdFilter
    A comma-delimited list of release definitions to retrieve.

.PARAMETER ArtifactType
    Release definitions with given artifactType will be returned. Values can be Build, Jenkins, GitHub, Nuget, Team Build (external), ExternalTFSBuild, Git, TFVC, ExternalTfsXamlBuild.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsReleaseDefinition -ApiVersion $apiversion -Project $project -DefinitionId $definitionid -Organization $organization

    Get a release definition.

.EXAMPLE
    PS C:\> Get-AdsReleaseDefinition -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of release definitions.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsExactNameMatch,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TagFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SearchText,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $PropertyFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $SearchTextContainsFolderName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactSourceId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionIdFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Definitions_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IsExactNameMatch' = 'isExactNameMatch'
            'DefinitionIdFilter' = 'definitionIdFilter'
            'ArtifactSourceId' = 'artifactSourceId'
            'SearchTextContainsFolderName' = 'searchTextContainsFolderName'
            'ApiVersion' = 'api-version'
            'PropertyFilters' = 'propertyFilters'
            'Top' = '$top'
            'SearchText' = 'searchText'
            'IsDeleted' = 'isDeleted'
            'QueryOrder' = 'queryOrder'
            'Expand' = '$expand'
            'ContinuationToken' = 'continuationToken'
            'Path' = 'path'
            'TagFilter' = 'tagFilter'
            'ArtifactType' = 'artifactType'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IsExactNameMatch','DefinitionIdFilter','ArtifactSourceId','SearchTextContainsFolderName','ApiVersion','PropertyFilters','Top','SearchText','IsDeleted','QueryOrder','Expand','ContinuationToken','Path','TagFilter','ArtifactType') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/definitions' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($DefinitionId) { $__path += "/$DefinitionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}