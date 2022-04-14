function Get-AdsPackagingFeedRecyclebinPackage {
<#
.SYNOPSIS
    

.DESCRIPTION
    Query for packages within the recycle bin.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER Skip
    Skip the first N packages.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ProtocolType
    Type of package (e.g. NuGet, npm, ...).

.PARAMETER Top
    Get the top N packages.

.PARAMETER IncludeAllVersions
    True to return all versions of the package in the response.  Default is false (latest version only).

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER Project
    Project ID or project name

.PARAMETER PackageNameQuery
    Filter to packages matching this name.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PackageId
    The package Id (GUID Id, not the package name).

.PARAMETER IncludeUrls
    True to return REST Urls with the response.  Default is True.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedRecyclebinPackage -ApiVersion $apiversion -FeedId $feedid -Project $project -Organization $organization -PackageId $packageid

    Get information about a package and all its versions within the recycle bin.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedRecyclebinPackage -ApiVersion $apiversion -FeedId $feedid -Project $project -Organization $organization

    Query for packages within the recycle bin.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProtocolType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAllVersions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageNameQuery,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package')]
        [string]
        $PackageId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package')]
        [boolean]
        $IncludeUrls
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'ApiVersion' = 'api-version'
            'ProtocolType' = 'protocolType'
            'Top' = '$top'
            'IncludeAllVersions' = 'includeAllVersions'
            'PackageNameQuery' = 'packageNameQuery'
            'IncludeUrls' = 'includeUrls'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','ApiVersion','ProtocolType','Top','IncludeAllVersions','PackageNameQuery','IncludeUrls') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/RecycleBin/Packages' -Replace '{feedId}',$FeedId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($PackageId) { $__path += "/$PackageId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}