function Set-AdsPackagingFeedPypiPackageUpstreaming {
<#
.SYNOPSIS
    

.DESCRIPTION
    Set the upstreaming behavior of a package within the context of a feed

The package does not need to necessarily exist in the feed prior to setting the behavior.
This assists with packages that are not yet ingested from an upstream, yet the feed owner wants
to apply a specific behavior on the first ingestion.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FeedId
    The name or id of the feed

.PARAMETER PackageName
    The name of the package

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsPackagingFeedPypiPackageUpstreaming -Organization $organization -FeedId $feedid -PackageName $packagename -Project $project -ApiVersion $apiversion

    Set the upstreaming behavior of a package within the context of a feed

The package does not need to necessarily exist in the feed prior to setting the behavior.
This assists with packages that are not yet ingested from an upstream, yet the feed owner wants
to apply a specific behavior on the first ingestion.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feedId}/pypi/packages/{packageName}/upstreaming' -Replace '{organization}',$Organization -Replace '{feedId}',$FeedId -Replace '{packageName}',$PackageName -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}