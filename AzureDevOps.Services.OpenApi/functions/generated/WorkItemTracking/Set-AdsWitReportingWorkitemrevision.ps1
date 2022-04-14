function Set-AdsWitReportingWorkitemrevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a batch of work item revisions. This request may be used if your list of fields is large enough that it may run the URL over the length limit.

.PARAMETER ContinuationToken
    Specifies the watermark to start the batch from. Omit this parameter to get the first batch of revisions.

.PARAMETER StartDateTime
    Date/time to use as a starting point for revisions, all revisions will occur after this date/time. Cannot be used in conjunction with 'watermark' parameter.

.PARAMETER Expand
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsWitReportingWorkitemrevision -Project $project -Organization $organization -ApiVersion $apiversion

    Get a batch of work item revisions. This request may be used if your list of fields is large enough that it may run the URL over the length limit.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StartDateTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'StartDateTime' = 'startDateTime'
            'Expand' = '$expand'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','StartDateTime','Expand','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/reporting/workitemrevisions' -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}