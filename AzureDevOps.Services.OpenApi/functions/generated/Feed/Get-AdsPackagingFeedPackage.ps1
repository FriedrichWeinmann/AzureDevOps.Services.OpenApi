function Get-AdsPackagingFeedPackage {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get details about all of the packages in the feed. Use the various filters to include or exclude information from the result set.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER GetTopPackageVersions
    Changes the behavior of $top and $skip to return all versions of each package up to $top. Must be used in conjunction with includeAllVersions=true

.PARAMETER PackageNameQuery
    Filter to packages that contain the provided string. Characters in the string must conform to the package name constraints.

.PARAMETER IncludeDeleted
    Return deleted or unpublished versions of packages in the response. Default is False.

.PARAMETER DirectUpstreamId
    Filter results to return packages from a specific upstream.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IsRelease
    Only applicable for Nuget packages. Use this to filter the response when includeAllVersions is set to true. Default is True (only return packages without prerelease versioning).

.PARAMETER Top
    Get the top N packages (or package versions where getTopPackageVersions=true)

.PARAMETER IncludeUrls
    True to return REST Urls with the response. Default is True.

.PARAMETER NormalizedPackageName
    [Obsolete] Used for legacy scenarios and may be removed in future versions.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER Skip
    Skip the first N packages (or package versions where getTopPackageVersions=true)

.PARAMETER IsListed
    Only applicable for NuGet packages, setting it for other package types will result in a 404. If false, delisted package versions will be returned. Use this to filter the response when includeAllVersions is set to true. Default is unset (do not return delisted packages).

.PARAMETER IncludeAllVersions
    True to return all versions of the package in the response. Default is false (latest version only).

.PARAMETER ProtocolType
    One of the supported artifact package types.

.PARAMETER PackageId
    The package Id (GUID Id, not the package name).

.PARAMETER IsCached
    [Obsolete] Used for legacy scenarios and may be removed in future versions.

.PARAMETER IncludeDescription
    Return the description for every version of each package in the response. Default is False.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedPackage -PackageId $packageid -FeedId $feedid -ApiVersion $apiversion -Project $project -Organization $organization

    Get details about a specific package.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedPackage -FeedId $feedid -ApiVersion $apiversion -Project $project -Organization $organization

    Get details about all of the packages in the feed. Use the various filters to include or exclude information from the result set.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $GetTopPackageVersions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageNameQuery,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [boolean]
        $IncludeDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DirectUpstreamId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [boolean]
        $IsRelease,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [boolean]
        $IncludeUrls,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $NormalizedPackageName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [string]
        $FeedId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [boolean]
        $IsListed,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [boolean]
        $IncludeAllVersions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProtocolType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [string]
        $PackageId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsCached,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [boolean]
        $IncludeDescription,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'GetTopPackageVersions' = 'getTopPackageVersions'
            'IsCached' = 'isCached'
            'ProtocolType' = 'protocolType'
            'IncludeAllVersions' = 'includeAllVersions'
            'IsListed' = 'isListed'
            'Skip' = '$skip'
            'IncludeDescription' = 'includeDescription'
            'NormalizedPackageName' = 'normalizedPackageName'
            'Top' = '$top'
            'IsRelease' = 'isRelease'
            'ApiVersion' = 'api-version'
            'DirectUpstreamId' = 'directUpstreamId'
            'IncludeDeleted' = 'includeDeleted'
            'PackageNameQuery' = 'packageNameQuery'
            'IncludeUrls' = 'includeUrls'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('GetTopPackageVersions','IsCached','ProtocolType','IncludeAllVersions','IsListed','Skip','IncludeDescription','NormalizedPackageName','Top','IsRelease','ApiVersion','DirectUpstreamId','IncludeDeleted','PackageNameQuery','IncludeUrls') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/packages' -Replace '{feedId}',$FeedId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($PackageId) { $__path += "/$PackageId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}