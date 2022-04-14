function Get-AdsGitRepositoryItem {
<#
.SYNOPSIS
    Get Item Metadata and/or Content for a collection of items.

.DESCRIPTION
    Get Item Metadata and/or Content for a collection of items. The download parameter is to indicate whether the content should be available as a download or just sent as a stream in the response. Doesn't apply to zipped content which is always returned as a download.

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER Download
    Set to true to download the response as a file.  Default is false.

.PARAMETER IncludeContentMetadata
    Set to true to include content metadata.  Default is false.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER VersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER RecursionLevel
    The recursion level of this request. The default is 'none', no recursion.

.PARAMETER ScopePath
    The path scope.  The default is null.

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER IncludeLinks
    Set to true to include links to items.  Default is false.

.PARAMETER Project
    Project ID or project name

.PARAMETER LatestProcessedChange
    Set to true to include the latest changes.  Default is false.

.PARAMETER Format
    If specified, this overrides the HTTP Accept request header to return either 'json' or 'zip'. If $format is specified, then api-version should also be specified as a query parameter.

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryItem -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Get Item Metadata and/or Content for a collection of items. The download parameter is to indicate whether the content should be available as a download or just sent as a stream in the response. Doesn't apply to zipped content which is always returned as a download.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Download,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeContentMetadata,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RecursionLevel,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopePath,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LatestProcessedChange,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Format,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'VersionType' = 'versionDescriptor.versionType'
            'Download' = 'download'
            'IncludeContentMetadata' = 'includeContentMetadata'
            'ApiVersion' = 'api-version'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'RecursionLevel' = 'recursionLevel'
            'ScopePath' = 'scopePath'
            'Version' = 'versionDescriptor.version'
            'IncludeLinks' = 'includeLinks'
            'LatestProcessedChange' = 'latestProcessedChange'
            'Format' = '$format'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('VersionType','Download','IncludeContentMetadata','ApiVersion','VersionOptions','RecursionLevel','ScopePath','Version','IncludeLinks','LatestProcessedChange','Format') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/items' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}