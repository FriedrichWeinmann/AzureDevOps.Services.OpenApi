function Set-AdsDistributedtaskElasticpoolNode {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update properties on a specified ElasticNode

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ElasticNodeId
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    

.EXAMPLE
    PS C:\> Set-AdsDistributedtaskElasticpoolNode -ApiVersion $apiversion -ElasticNodeId $elasticnodeid -Organization $organization -PoolId $poolid

    Update properties on a specified ElasticNode

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
        $ElasticNodeId,

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
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools/{poolId}/nodes/{elasticNodeId}' -Replace '{elasticNodeId}',$ElasticNodeId -Replace '{organization}',$Organization -Replace '{poolId}',$PoolId
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}