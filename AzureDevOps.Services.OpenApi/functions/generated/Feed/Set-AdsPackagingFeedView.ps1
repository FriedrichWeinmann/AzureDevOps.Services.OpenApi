function Set-AdsPackagingFeedView {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update a view.

The project parameter must be supplied if the feed was created in a project.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER Project
    Project ID or project name

.PARAMETER ViewId
    Name or Id of the view.

.EXAMPLE
    PS C:\> Set-AdsPackagingFeedView -Organization $organization -ApiVersion $apiversion -FeedId $feedid -Project $project -ViewId $viewid

    Update a view.

The project parameter must be supplied if the feed was created in a project.

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ViewId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/views/{viewId}' -Replace '{organization}',$Organization -Replace '{feedId}',$FeedId -Replace '{project}',$Project -Replace '{viewId}',$ViewId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}