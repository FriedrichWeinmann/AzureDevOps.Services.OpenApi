function Get-AdsDistributedtaskElasticpool {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of all Elastic Pools.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PoolId
    Pool Id of the associated TaskAgentPool

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpool -ApiVersion $apiversion -Organization $organization

    Get a list of all Elastic Pools.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskElasticpool -ApiVersion $apiversion -Organization $organization -PoolId $poolid

    Returns the Elastic Pool with the specified Pool Id.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Elasticpools_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Elasticpools_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Elasticpools_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools' -Replace '{organization}',$Organization
        if ($PoolId) { $__path += "/$PoolId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}