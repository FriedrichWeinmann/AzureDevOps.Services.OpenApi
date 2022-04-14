function Set-AdsPackagingFeedPypiPackageUpstreaming {
<#
.SYNOPSIS
    

.DESCRIPTION
    Set the upstreaming behavior of a package within the context of a feed

The package does not need to necessarily exist in the feed prior to setting the behavior.
This assists with packages that are not yet ingested from an upstream, yet the feed owner wants
to apply a specific behavior on the first ingestion.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER PackageName
    The name of the package

.PARAMETER FeedId
    The name or id of the feed

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Set-AdsPackagingFeedPypiPackageUpstreaming -ApiVersion $apiversion -PackageName $packagename -FeedId $feedid -Organization $organization -Project $project

    Set the upstreaming behavior of a package within the context of a feed

The package does not need to necessarily exist in the feed prior to setting the behavior.
This assists with packages that are not yet ingested from an upstream, yet the feed owner wants
to apply a specific behavior on the first ingestion.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feedId}/pypi/packages/{packageName}/upstreaming' -Replace '{packageName}',$PackageName -Replace '{feedId}',$FeedId -Replace '{organization}',$Organization -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}