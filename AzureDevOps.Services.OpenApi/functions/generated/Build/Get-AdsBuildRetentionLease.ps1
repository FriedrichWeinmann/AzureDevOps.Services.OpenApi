function Get-AdsBuildRetentionLease {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns any leases matching the specified MinimalRetentionLeases

.PARAMETER LeasesToFetch
    List of JSON-serialized MinimalRetentionLeases separated by '|'

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER LeaseId
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Get-AdsBuildRetentionLease -LeasesToFetch $leasestofetch -ApiVersion $apiversion -Organization $organization -Project $project

    Returns any leases matching the specified MinimalRetentionLeases

.EXAMPLE
    PS C:\> Get-AdsBuildRetentionLease -ApiVersion $apiversion -LeaseId $leaseid -Organization $organization -Project $project

    Returns the details of the retention lease given a lease id.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $LeasesToFetch,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Leases_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Leases_Get')]
        [string]
        $LeaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Leases_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Leases_Get')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'LeasesToFetch' = 'leasesToFetch'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('LeasesToFetch','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/retention/leases' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($LeaseId) { $__path += "/$LeaseId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}