function Get-AdsPackagingFeedPackageVersion {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of package versions, optionally filtering by state.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER PackageVersionId
    Id of the package version (GUID Id, not name).

.PARAMETER IncludeUrls
    True to include urls for each version. Default is true.

.PARAMETER PackageId
    Id of the package (GUID Id, not name).

.PARAMETER IsDeleted
    If set specifies whether to return only deleted or non-deleted versions of packages in the response. Default is unset (return all versions).

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IsListed
    Only applicable for NuGet packages. If false, delisted package versions will be returned.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedPackageVersion -FeedId $feedid -PackageId $packageid -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of package versions, optionally filtering by state.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedPackageVersion -FeedId $feedid -PackageVersionId $packageversionid -PackageId $packageid -ApiVersion $apiversion -Project $project -Organization $organization

    Get details about a specific package version.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [string]
        $PackageVersionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [boolean]
        $IncludeUrls,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [string]
        $PackageId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [boolean]
        $IsDeleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [boolean]
        $IsListed,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Artifact  Details_Get Package Version')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeUrls' = 'includeUrls'
            'IsDeleted' = 'isDeleted'
            'ApiVersion' = 'api-version'
            'IsListed' = 'isListed'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeUrls','IsDeleted','ApiVersion','IsListed') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/Packages/{packageId}/versions' -Replace '{feedId}',$FeedId -Replace '{packageId}',$PackageId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($PackageVersionId) { $__path += "/$PackageVersionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}