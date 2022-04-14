function Get-AdsNotificationDiagnosticlogEntrie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of diagnostic logs for this service.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER StartTime
    Start time for the time range to query in.

.PARAMETER EndTime
    End time for the time range to query in.

.PARAMETER EntryId
    The ID of the specific log to query for.

.PARAMETER Source
    ID specifying which type of logs to check diagnostics for.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsNotificationDiagnosticlogEntrie -Organization $organization -EntryId $entryid -Source $source -ApiVersion $apiversion

    Get a list of diagnostic logs for this service.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StartTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EntryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Source,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'StartTime' = 'startTime'
            'EndTime' = 'endTime'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('StartTime','EndTime','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://{service}.dev.azure.com/{organization}/_apis/notification/diagnosticlogs/{source}/entries/{entryId}' -Replace '{organization}',$Organization -Replace '{entryId}',$EntryId -Replace '{source}',$Source

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}