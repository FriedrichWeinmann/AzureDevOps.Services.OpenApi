function Get-AdsDistributedtaskPoolAgent {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of agents.

.PARAMETER PoolId
    The agent pool containing the agents

.PARAMETER IncludeAssignedRequest
    Whether to include details about the agents' current work

.PARAMETER IncludeLastCompletedRequest
    Whether to include details about the agents' most recent completed work

.PARAMETER PropertyFilters
    Filter which custom properties will be returned

.PARAMETER AgentId
    The agent ID to get information about

.PARAMETER IncludeCapabilities
    Whether to include the agents' capabilities in the response

.PARAMETER AgentName
    Filter on agent name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Demands
    Filter by demands the agents can satisfy

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskPoolAgent -PoolId $poolid -AgentId $agentid -Organization $organization -ApiVersion $apiversion

    Get information about an agent.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskPoolAgent -PoolId $poolid -Organization $organization -ApiVersion $apiversion

    Get a list of agents.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [string]
        $PoolId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [boolean]
        $IncludeAssignedRequest,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [boolean]
        $IncludeLastCompletedRequest,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [string]
        $PropertyFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [string]
        $AgentId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [boolean]
        $IncludeCapabilities,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Demands,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Agents_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'IncludeAssignedRequest' = 'includeAssignedRequest'
            'IncludeLastCompletedRequest' = 'includeLastCompletedRequest'
            'PropertyFilters' = 'propertyFilters'
            'IncludeCapabilities' = 'includeCapabilities'
            'AgentName' = 'agentName'
            'Demands' = 'demands'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeAssignedRequest','IncludeLastCompletedRequest','PropertyFilters','IncludeCapabilities','AgentName','Demands','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/pools/{poolId}/agents' -Replace '{poolId}',$PoolId -Replace '{organization}',$Organization
        if ($AgentId) { $__path += "/$AgentId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}