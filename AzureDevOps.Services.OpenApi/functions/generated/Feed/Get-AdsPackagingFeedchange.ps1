﻿function Get-AdsPackagingFeedchange {
<#
.SYNOPSIS
    

.DESCRIPTION
    Query to determine which feeds have changed since the last call, tracked through the provided continuationToken. Only changes to a feed itself are returned and impact the continuationToken, not additions or alterations to packages within the feeds.

If the project parameter is present, gets all feed changes in the given project.
If omitted, gets all feed changes in the organization.

.PARAMETER ContinuationToken
    A continuation token which acts as a bookmark to a previously retrieved change. This token allows the user to continue retrieving changes in batches, picking up where the previous batch left off. If specified, all the changes that occur strictly after the token will be returned. If not specified or 0, iteration will start with the first change.

.PARAMETER IncludeDeleted
    If true, get changes for all feeds including deleted feeds. The default value is false.

.PARAMETER BatchSize
    Number of package changes to fetch. The default value is 1000. The maximum value is 2000.

.PARAMETER FeedId
    Name or ID of the feed.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedchange -ApiVersion $apiversion -Project $project -Organization $organization

    Query to determine which feeds have changed since the last call, tracked through the provided continuationToken. Only changes to a feed itself are returned and impact the continuationToken, not additions or alterations to packages within the feeds.

If the project parameter is present, gets all feed changes in the given project.
If omitted, gets all feed changes in the organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedchange -FeedId $feedid -ApiVersion $apiversion -Project $project -Organization $organization

    Query a feed to determine its current state.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $BatchSize,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Change  Tracking_Get Feed Change')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'IncludeDeleted' = 'includeDeleted'
            'BatchSize' = 'batchSize'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','IncludeDeleted','BatchSize','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/feedchanges' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($FeedId) { $__path += "/$FeedId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}