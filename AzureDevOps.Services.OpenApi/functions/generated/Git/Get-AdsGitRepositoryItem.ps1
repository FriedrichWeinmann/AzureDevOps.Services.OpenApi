function Get-AdsGitRepositoryItem {
<#
.SYNOPSIS
    Get Item Metadata and/or Content for a collection of items.

.DESCRIPTION
    Get Item Metadata and/or Content for a collection of items. The download parameter is to indicate whether the content should be available as a download or just sent as a stream in the response. Doesn't apply to zipped content which is always returned as a download.

.PARAMETER Format
    If specified, this overrides the HTTP Accept request header to return either 'json' or 'zip'. If $format is specified, then api-version should also be specified as a query parameter.

.PARAMETER Download
    Set to true to download the response as a file.  Default is false.

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER ScopePath
    The path scope.  The default is null.

.PARAMETER VersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER IncludeLinks
    Set to true to include links to items.  Default is false.

.PARAMETER LatestProcessedChange
    Set to true to include the latest changes.  Default is false.

.PARAMETER IncludeContentMetadata
    Set to true to include content metadata.  Default is false.

.PARAMETER RecursionLevel
    The recursion level of this request. The default is 'none', no recursion.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RepositoryId
    The name or ID of the repository.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryItem -Organization $organization -Project $project -ApiVersion $apiversion -RepositoryId $repositoryid

    Get Item Metadata and/or Content for a collection of items. The download parameter is to indicate whether the content should be available as a download or just sent as a stream in the response. Doesn't apply to zipped content which is always returned as a download.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Format,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Download,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopePath,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LatestProcessedChange,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeContentMetadata,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RecursionLevel,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId
    )
    process {
        $__mapping = @{
            'Format' = '$format'
            'Download' = 'download'
            'VersionType' = 'versionDescriptor.versionType'
            'ScopePath' = 'scopePath'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'IncludeLinks' = 'includeLinks'
            'LatestProcessedChange' = 'latestProcessedChange'
            'IncludeContentMetadata' = 'includeContentMetadata'
            'RecursionLevel' = 'recursionLevel'
            'Version' = 'versionDescriptor.version'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Format','Download','VersionType','ScopePath','VersionOptions','IncludeLinks','LatestProcessedChange','IncludeContentMetadata','RecursionLevel','Version','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/items' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}