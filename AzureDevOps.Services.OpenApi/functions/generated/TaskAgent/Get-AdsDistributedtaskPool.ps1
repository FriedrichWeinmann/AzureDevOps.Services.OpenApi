function Get-AdsDistributedtaskPool {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of agent pools.

.PARAMETER PoolId
    An agent pool ID

.PARAMETER ActionFilter
    Filter by whether the calling user has use or manage permissions

.PARAMETER PoolIds
    pool Ids to fetch

.PARAMETER Properties
    Agent pool properties (comma-separated)

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskPool -PoolId $poolid -Organization $organization -ApiVersion $apiversion

    Get information about an agent pool.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskPool -PoolIds $poolids -Organization $organization -ApiVersion $apiversion

    Get a list of agent pools.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $PoolId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $ActionFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $Properties,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pools_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ActionFilter' = 'actionFilter'
            'PoolIds' = 'poolIds'
            'Properties' = 'properties'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ActionFilter','PoolIds','Properties','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/pools' -Replace '{organization}',$Organization
        if ($PoolId) { $__path += "/$PoolId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}