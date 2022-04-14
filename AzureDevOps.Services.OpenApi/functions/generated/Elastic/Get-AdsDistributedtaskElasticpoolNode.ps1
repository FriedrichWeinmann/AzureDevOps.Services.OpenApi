function Get-AdsDistributedtaskElasticpoolNode {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of ElasticNodes currently in the ElasticPool

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER State
    Optional: Filter to only retrieve ElasticNodes in the given ElasticNodeState

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    Pool id of the ElasticPool

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpoolNode -ApiVersion $apiversion -Organization $organization -PoolId $poolid

    Get a list of ElasticNodes currently in the ElasticPool

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $State,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'State' = '$state'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','State') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools/{poolId}/nodes' -Replace '{organization}',$Organization -Replace '{poolId}',$PoolId
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}