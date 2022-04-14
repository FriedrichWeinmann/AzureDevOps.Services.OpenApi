function Get-AdsPackagingFeedchange {
<#
.SYNOPSIS
    

.DESCRIPTION
    Query to determine which feeds have changed since the last call, tracked through the provided continuationToken. Only changes to a feed itself are returned and impact the continuationToken, not additions or alterations to packages within the feeds.

If the project parameter is present, gets all feed changes in the given project.
If omitted, gets all feed changes in the organization.

.PARAMETER ContinuationToken
    A continuation token which acts as a bookmark to a previously retrieved change. This token allows the user to continue retrieving changes in batches, picking up where the previous batch left off. If specified, all the changes that occur strictly after the token will be returned. If not specified or 0, iteration will start with the first change.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER BatchSize
    Number of package changes to fetch. The default value is 1000. The maximum value is 2000.

.PARAMETER FeedId
    Name or ID of the feed.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeDeleted
    If true, get changes for all feeds including deleted feeds. The default value is false.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedchange -Organization $organization -FeedId $feedid -Project $project -ApiVersion $apiversion

    Query a feed to determine its current state.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedchange -Organization $organization -Project $project -ApiVersion $apiversion

    Query to determine which feeds have changed since the last call, tracked through the provided continuationToken. Only changes to a feed itself are returned and impact the continuationToken, not additions or alterations to packages within the feeds.

If the project parameter is present, gets all feed changes in the given project.
If omitted, gets all feed changes in the organization.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $BatchSize,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDeleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'BatchSize' = 'batchSize'
            'IncludeDeleted' = 'includeDeleted'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','BatchSize','IncludeDeleted','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/feedchanges' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($FeedId) { $__path += "/$FeedId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}