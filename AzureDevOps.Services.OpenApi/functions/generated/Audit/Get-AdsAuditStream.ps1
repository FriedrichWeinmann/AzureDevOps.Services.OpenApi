function Get-AdsAuditStream {
<#
.SYNOPSIS
    

.DESCRIPTION
    Return all Audit Streams scoped to an organization

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER StreamId
    Id of stream entry to retrieve

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsAuditStream -Organization $organization -StreamId $streamid -ApiVersion $apiversion

    Return Audit Stream with id of streamId if one exists otherwise throw

.EXAMPLE
    PS C:\> Get-AdsAuditStream -Organization $organization -ApiVersion $apiversion

    Return all Audit Streams scoped to an organization

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Query Stream By Id')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Query Stream By Id')]
        [string]
        $StreamId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Streams_Query Stream By Id')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://auditservice.dev.azure.com/{organization}/_apis/audit/streams' -Replace '{organization}',$Organization
        if ($StreamId) { $__path += "/$StreamId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}