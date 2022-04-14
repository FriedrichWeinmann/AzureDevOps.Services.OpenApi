function Get-AdsDistributedtaskElasticpool {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of all Elastic Pools.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    Pool Id of the associated TaskAgentPool

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpool -Organization $organization -PoolId $poolid -ApiVersion $apiversion

    Returns the Elastic Pool with the specified Pool Id.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpool -Organization $organization -ApiVersion $apiversion

    Get a list of all Elastic Pools.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Elasticpools_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Elasticpools_Get')]
        [string]
        $PoolId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Elasticpools_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools' -Replace '{organization}',$Organization
        if ($PoolId) { $__path += "/$PoolId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}