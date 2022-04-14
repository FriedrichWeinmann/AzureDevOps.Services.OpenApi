function Get-AdsPackagingFeedView {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all views for a feed.

The project parameter must be supplied if the feed was created in a project.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER ViewId
    Name or Id of the view.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedView -Organization $organization -FeedId $feedid -ViewId $viewid -Project $project -ApiVersion $apiversion

    Get a view by Id.

The project parameter must be supplied if the feed was created in a project.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedView -Organization $organization -FeedId $feedid -Project $project -ApiVersion $apiversion

    Get all views for a feed.

The project parameter must be supplied if the feed was created in a project.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed View')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed View')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed View')]
        [string]
        $ViewId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed View')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed View')]
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
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/views' -Replace '{organization}',$Organization -Replace '{feedId}',$FeedId -Replace '{project}',$Project
        if ($ViewId) { $__path += "/$ViewId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}