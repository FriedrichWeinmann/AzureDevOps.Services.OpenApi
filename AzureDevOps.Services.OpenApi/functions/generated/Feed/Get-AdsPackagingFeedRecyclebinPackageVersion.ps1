function Get-AdsPackagingFeedRecyclebinPackageVersion {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of package versions within the recycle bin.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER PackageVersionId
    The package version Id 9guid Id, not the version string).

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PackageId
    The package Id (GUID Id, not the package name).

.PARAMETER IncludeUrls
    True to return REST Urls with the response.  Default is True.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedRecyclebinPackageVersion -PackageVersionId $packageversionid -FeedId $feedid -Project $project -ApiVersion $apiversion -Organization $organization -PackageId $packageid

    Get information about a package version within the recycle bin.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedRecyclebinPackageVersion -FeedId $feedid -Project $project -ApiVersion $apiversion -Organization $organization -PackageId $packageid

    Get a list of package versions within the recycle bin.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [string]
        $PackageVersionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [string]
        $PackageId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recycle  Bin_Get Recycle Bin Package Version')]
        [boolean]
        $IncludeUrls
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'IncludeUrls' = 'includeUrls'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','IncludeUrls') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/RecycleBin/Packages/{packageId}/Versions' -Replace '{feedId}',$FeedId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{packageId}',$PackageId
        if ($PackageVersionId) { $__path += "/$PackageVersionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}