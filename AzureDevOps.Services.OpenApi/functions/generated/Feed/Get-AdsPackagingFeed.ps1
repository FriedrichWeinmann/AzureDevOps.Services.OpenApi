function Get-AdsPackagingFeed {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all feeds in an account where you have the provided role access.

If the project parameter is present, gets all feeds in the given project.
If omitted, gets all feeds in the organization.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IncludeUrls
    Resolve names if true

.PARAMETER IncludeDeletedUpstreams
    Include upstreams that have been deleted in the response.

.PARAMETER FeedRole
    Filter by this role, either Administrator(4), Contributor(3), or Reader(2) level permissions.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeed -ApiVersion $apiversion -Project $project -Organization $organization

    Get all feeds in an account where you have the provided role access.

If the project parameter is present, gets all feeds in the given project.
If omitted, gets all feeds in the organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeed -FeedId $feedid -ApiVersion $apiversion -Project $project -Organization $organization

    Get the settings for a specific feed.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeUrls,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [boolean]
        $IncludeDeletedUpstreams,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FeedRole,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Feed  Management_Get Feed')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'IncludeUrls' = 'includeUrls'
            'IncludeDeletedUpstreams' = 'includeDeletedUpstreams'
            'FeedRole' = 'feedRole'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','IncludeUrls','IncludeDeletedUpstreams','FeedRole') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/feeds' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($FeedId) { $__path += "/$FeedId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}