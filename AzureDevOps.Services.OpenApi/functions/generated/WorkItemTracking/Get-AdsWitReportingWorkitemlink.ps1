function Get-AdsWitReportingWorkitemlink {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a batch of work item links

.PARAMETER LinkTypes
    A list of types to filter the results to specific link types. Omit this parameter to get work item links of all link types.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Types
    A list of types to filter the results to specific work item types. Omit this parameter to get work item links of all work item types.

.PARAMETER Project
    Project ID or project name

.PARAMETER ContinuationToken
    Specifies the continuationToken to start the batch from. Omit this parameter to get the first batch of links.

.PARAMETER StartDateTime
    Date/time to use as a starting point for link changes. Only link changes that occurred after that date/time will be returned. Cannot be used in conjunction with 'watermark' parameter.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitReportingWorkitemlink -Organization $organization -Project $project -ApiVersion $apiversion

    Get a batch of work item links

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $LinkTypes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Types,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StartDateTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'LinkTypes' = 'linkTypes'
            'Types' = 'types'
            'ContinuationToken' = 'continuationToken'
            'StartDateTime' = 'startDateTime'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('LinkTypes','Types','ContinuationToken','StartDateTime','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/reporting/workitemlinks' -Replace '{organization}',$Organization -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}