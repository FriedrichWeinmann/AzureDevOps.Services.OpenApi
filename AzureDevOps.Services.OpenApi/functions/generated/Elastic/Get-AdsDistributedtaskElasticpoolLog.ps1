function Get-AdsDistributedtaskElasticpoolLog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get elastic pool diagnostics logs for a specified Elastic Pool.

.PARAMETER Top
    Number of elastic pool logs to retrieve

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    Pool Id of the Elastic Pool

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpoolLog -ApiVersion $apiversion -Organization $organization -PoolId $poolid

    Get elastic pool diagnostics logs for a specified Elastic Pool.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolId
    )
    process {
        $__mapping = @{
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools/{poolId}/logs' -Replace '{organization}',$Organization -Replace '{poolId}',$PoolId
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}