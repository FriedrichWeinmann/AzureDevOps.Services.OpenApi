function Set-AdsAuditStream {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create new Audit Stream

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DaysToBackfill
    The number of days of previously recorded audit data that will be replayed into the stream. A value of zero will result in only new events being streamed.

.EXAMPLE
    PS C:\> Set-AdsAuditStream -ApiVersion $apiversion -Organization $organization -DaysToBackfill $daystobackfill

    Create new Audit Stream

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DaysToBackfill
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'DaysToBackfill' = 'daysToBackfill'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','DaysToBackfill') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://auditservice.dev.azure.com/{organization}/_apis/audit/streams' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}