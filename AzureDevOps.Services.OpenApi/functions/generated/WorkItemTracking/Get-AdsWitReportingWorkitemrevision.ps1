function Get-AdsWitReportingWorkitemrevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a batch of work item revisions with the option of including deleted items

.PARAMETER IncludeDeleted
    Specify if the deleted item should be returned.

.PARAMETER MaxPageSize
    The maximum number of results to return in this batch

.PARAMETER ContinuationToken
    Specifies the watermark to start the batch from. Omit this parameter to get the first batch of revisions.

.PARAMETER Expand
    Return all the fields in work item revisions, including long text fields which are not returned by default

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER IncludeIdentityRef
    Return an identity reference instead of a string value for identity fields.

.PARAMETER StartDateTime
    Date/time to use as a starting point for revisions, all revisions will occur after this date/time. Cannot be used in conjunction with 'watermark' parameter.

.PARAMETER Fields
    A list of fields to return in work item revisions. Omit this parameter to get all reportable fields.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IncludeTagRef
    Specify if the tag objects should be returned for System.Tags field.

.PARAMETER Types
    A list of types to filter the results to specific work item types. Omit this parameter to get work item revisions of all work item types.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeLatestOnly
    Return only the latest revisions of work items, skipping all historical revisions

.PARAMETER IncludeDiscussionChangesOnly
    Return only the those revisions of work items, where only history field was changed

.EXAMPLE
    PS C:\> Get-AdsWitReportingWorkitemrevision -ApiVersion $apiversion -Organization $organization -Project $project

    Get a batch of work item revisions with the option of including deleted items

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxPageSize,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeIdentityRef,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StartDateTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Fields,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeTagRef,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Types,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLatestOnly,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDiscussionChangesOnly
    )
    process {
        $__mapping = @{
            'IncludeDeleted' = 'includeDeleted'
            'MaxPageSize' = '$maxPageSize'
            'ContinuationToken' = 'continuationToken'
            'Expand' = '$expand'
            'ApiVersion' = 'api-version'
            'IncludeIdentityRef' = 'includeIdentityRef'
            'StartDateTime' = 'startDateTime'
            'Fields' = 'fields'
            'IncludeTagRef' = 'includeTagRef'
            'Types' = 'types'
            'IncludeLatestOnly' = 'includeLatestOnly'
            'IncludeDiscussionChangesOnly' = 'includeDiscussionChangesOnly'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeDeleted','MaxPageSize','ContinuationToken','Expand','ApiVersion','IncludeIdentityRef','StartDateTime','Fields','IncludeTagRef','Types','IncludeLatestOnly','IncludeDiscussionChangesOnly') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/reporting/workitemrevisions' -Replace '{organization}',$Organization -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}