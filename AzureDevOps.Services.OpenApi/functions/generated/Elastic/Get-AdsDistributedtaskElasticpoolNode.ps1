function Get-AdsDistributedtaskElasticpoolNode {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of ElasticNodes currently in the ElasticPool

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    Pool id of the ElasticPool

.PARAMETER State
    Optional: Filter to only retrieve ElasticNodes in the given ElasticNodeState

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpoolNode -Organization $organization -PoolId $poolid -ApiVersion $apiversion

    Get a list of ElasticNodes currently in the ElasticPool

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $State,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'State' = '$state'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('State','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools/{poolId}/nodes' -Replace '{organization}',$Organization -Replace '{poolId}',$PoolId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}