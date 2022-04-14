function New-AdsAuditStream {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update existing Audit Stream

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER StreamId
    Id of stream entry to be updated

.PARAMETER Status
    Status of the stream

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> New-AdsAuditStream -Organization $organization -StreamId $streamid -Status $status -ApiVersion $apiversion

    Update existing Audit Stream status

.EXAMPLE
    PS C:\> New-AdsAuditStream -Organization $organization -ApiVersion $apiversion

    Update existing Audit Stream

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Update Status')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Update Status')]
        [string]
        $StreamId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Update Status')]
        [string]
        $Status,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Update Status')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Status' = 'status'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Status','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://auditservice.dev.azure.com/{organization}/_apis/audit/streams' -Replace '{organization}',$Organization
        if ($StreamId) { $__path += "/$StreamId" }

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}