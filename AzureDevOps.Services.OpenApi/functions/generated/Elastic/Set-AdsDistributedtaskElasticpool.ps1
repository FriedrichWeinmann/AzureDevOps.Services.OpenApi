function Set-AdsDistributedtaskElasticpool {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create a new elastic pool. This will create a new TaskAgentPool at the organization level. If a project id is provided, this will create a new TaskAgentQueue in the specified project.

.PARAMETER AuthorizeAllPipelines
    Setting to determine if all pipelines are authorized to use this TaskAgentPool by default.

.PARAMETER AutoProvisionProjectPools
    Setting to automatically provision TaskAgentQueues in every project for the new pool.

.PARAMETER PoolName
    Name to use for the new TaskAgentPool

.PARAMETER ProjectId
    Optional: If provided, a new TaskAgentQueue will be created in the specified project.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsDistributedtaskElasticpool -PoolName $poolname -ApiVersion $apiversion -Organization $organization

    Create a new elastic pool. This will create a new TaskAgentPool at the organization level. If a project id is provided, this will create a new TaskAgentQueue in the specified project.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $AuthorizeAllPipelines,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $AutoProvisionProjectPools,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProjectId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'AuthorizeAllPipelines' = 'authorizeAllPipelines'
            'AutoProvisionProjectPools' = 'autoProvisionProjectPools'
            'PoolName' = 'poolName'
            'ProjectId' = 'projectId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('AuthorizeAllPipelines','AutoProvisionProjectPools','PoolName','ProjectId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/elasticpools' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}