function Set-AdsPackagingFeedUpackPackagesbatch {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FeedId
    Name or ID of the feed.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsPackagingFeedUpackPackagesbatch -Organization $organization -FeedId $feedid -Project $project -ApiVersion $apiversion

    Update several packages from a single feed in a single request. The updates to the packages do not happen atomically.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

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
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feedId}/upack/packagesbatch' -Replace '{organization}',$Organization -Replace '{feedId}',$FeedId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}