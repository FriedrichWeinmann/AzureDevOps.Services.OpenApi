function Get-AdsPackagingFeed {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all feeds in an account where you have the provided role access.

If the project parameter is present, gets all feeds in the given project.
If omitted, gets all feeds in the organization.

.PARAMETER IncludeDeletedUpstreams
    Include upstreams that have been deleted in the response.

.PARAMETER FeedRole
    Filter by this role, either Administrator(4), Contributor(3), or Reader(2) level permissions.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IncludeUrls
    Resolve names if true

.EXAMPLE
    PS C:\> Get-AdsPackagingFeed -FeedId $feedid -Project $project -ApiVersion $apiversion -Organization $organization

    Get the settings for a specific feed.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeed -Project $project -ApiVersion $apiversion -Organization $organization

    Get all feeds in an account where you have the provided role access.

If the project parameter is present, gets all feeds in the given project.
If omitted, gets all feeds in the organization.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [boolean]
        $IncludeDeletedUpstreams,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FeedRole,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeUrls
    )
    process {
        $__mapping = @{
            'IncludeDeletedUpstreams' = 'includeDeletedUpstreams'
            'FeedRole' = 'feedRole'
            'ApiVersion' = 'api-version'
            'IncludeUrls' = 'includeUrls'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeDeletedUpstreams','FeedRole','ApiVersion','IncludeUrls') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/feeds' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($FeedId) { $__path += "/$FeedId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}