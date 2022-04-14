function Get-AdsBuildRetentionLease {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns any leases matching the specified MinimalRetentionLeases

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER LeaseId
    

.PARAMETER Project
    Project ID or project name

.PARAMETER LeasesToFetch
    List of JSON-serialized MinimalRetentionLeases separated by '|'

.EXAMPLE
    PS C:\> Get-AdsBuildRetentionLease -Organization $organization -ApiVersion $apiversion -LeaseId $leaseid -Project $project

    Returns the details of the retention lease given a lease id.

.EXAMPLE
    PS C:\> Get-AdsBuildRetentionLease -Organization $organization -ApiVersion $apiversion -Project $project -LeasesToFetch $leasestofetch

    Returns any leases matching the specified MinimalRetentionLeases

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Leases_Get')]
        [string]
        $Organization,

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
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $LeasesToFetch
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'LeasesToFetch' = 'leasesToFetch'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','LeasesToFetch') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/retention/leases' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($LeaseId) { $__path += "/$LeaseId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}