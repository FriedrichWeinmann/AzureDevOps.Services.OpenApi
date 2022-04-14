function Get-AdsAuditDownloadlog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Downloads audit log entries.

.PARAMETER EndTime
    End time of download window. Optional

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Format
    File format for download. Can be "json" or "csv".

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER StartTime
    Start time of download window. Optional

.EXAMPLE
    PS C:\> Get-AdsAuditDownloadlog -ApiVersion $apiversion -Format $format -Organization $organization

    Downloads audit log entries.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Format,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StartTime
    )
    process {
        $__mapping = @{
            'EndTime' = 'endTime'
            'ApiVersion' = 'api-version'
            'Format' = 'format'
            'StartTime' = 'startTime'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('EndTime','ApiVersion','Format','StartTime') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://auditservice.dev.azure.com/{organization}/_apis/audit/downloadlog' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}