function Get-AdsCltAgentgroupAgent {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER AgentGroupId
    The agent group identifier

.PARAMETER AgentName
    Name of the static agent

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsCltAgentgroupAgent -Organization $organization -AgentGroupId $agentgroupid -ApiVersion $apiversion

    <insert description here>

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
        $AgentGroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'AgentName' = 'agentName'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('AgentName','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/agentGroups/{agentGroupId}/agents' -Replace '{organization}',$Organization -Replace '{agentGroupId}',$AgentGroupId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}