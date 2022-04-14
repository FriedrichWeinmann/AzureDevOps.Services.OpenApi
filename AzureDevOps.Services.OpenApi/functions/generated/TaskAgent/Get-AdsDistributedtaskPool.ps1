function Get-AdsDistributedtaskPool {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of agent pools.

.PARAMETER ActionFilter
    Filter by whether the calling user has use or manage permissions

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Properties
    Agent pool properties (comma-separated)

.PARAMETER PoolIds
    pool Ids to fetch

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    An agent pool ID

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskPool -ApiVersion $apiversion -PoolIds $poolids -Organization $organization

    Get a list of agent pools.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskPool -ApiVersion $apiversion -Organization $organization -PoolId $poolid

    Get information about an agent pool.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $ActionFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $Properties,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $PoolId
    )
    process {
        $__mapping = @{
            'ActionFilter' = 'actionFilter'
            'ApiVersion' = 'api-version'
            'Properties' = 'properties'
            'PoolIds' = 'poolIds'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ActionFilter','ApiVersion','Properties','PoolIds') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/pools' -Replace '{organization}',$Organization
        if ($PoolId) { $__path += "/$PoolId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}