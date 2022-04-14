function Get-AdsWitReportingWorkitemrevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a batch of work item revisions with the option of including deleted items

.PARAMETER IncludeIdentityRef
    Return an identity reference instead of a string value for identity fields.

.PARAMETER Types
    A list of types to filter the results to specific work item types. Omit this parameter to get work item revisions of all work item types.

.PARAMETER IncludeLatestOnly
    Return only the latest revisions of work items, skipping all historical revisions

.PARAMETER Expand
    Return all the fields in work item revisions, including long text fields which are not returned by default

.PARAMETER Fields
    A list of fields to return in work item revisions. Omit this parameter to get all reportable fields.

.PARAMETER IncludeTagRef
    Specify if the tag objects should be returned for System.Tags field.

.PARAMETER Project
    Project ID or project name

.PARAMETER ContinuationToken
    Specifies the watermark to start the batch from. Omit this parameter to get the first batch of revisions.

.PARAMETER MaxPageSize
    The maximum number of results to return in this batch

.PARAMETER IncludeDeleted
    Specify if the deleted item should be returned.

.PARAMETER IncludeDiscussionChangesOnly
    Return only the those revisions of work items, where only history field was changed

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER StartDateTime
    Date/time to use as a starting point for revisions, all revisions will occur after this date/time. Cannot be used in conjunction with 'watermark' parameter.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWitReportingWorkitemrevision -Project $project -ApiVersion $apiversion -Organization $organization

    Get a batch of work item revisions with the option of including deleted items

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeIdentityRef,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Types,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLatestOnly,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Fields,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeTagRef,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxPageSize,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDiscussionChangesOnly,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StartDateTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeIdentityRef' = 'includeIdentityRef'
            'Types' = 'types'
            'IncludeLatestOnly' = 'includeLatestOnly'
            'Expand' = '$expand'
            'Fields' = 'fields'
            'IncludeTagRef' = 'includeTagRef'
            'ContinuationToken' = 'continuationToken'
            'MaxPageSize' = '$maxPageSize'
            'IncludeDeleted' = 'includeDeleted'
            'IncludeDiscussionChangesOnly' = 'includeDiscussionChangesOnly'
            'ApiVersion' = 'api-version'
            'StartDateTime' = 'startDateTime'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeIdentityRef','Types','IncludeLatestOnly','Expand','Fields','IncludeTagRef','ContinuationToken','MaxPageSize','IncludeDeleted','IncludeDiscussionChangesOnly','ApiVersion','StartDateTime') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/reporting/workitemrevisions' -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}