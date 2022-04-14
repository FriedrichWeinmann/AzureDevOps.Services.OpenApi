function Get-AdsCltAgentgroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER AgentGroupName
    Name of the agent group

.PARAMETER AgentGroupId
    The agent group identifier

.PARAMETER MachineSetupInput
    

.PARAMETER OutgoingRequestUrls
    

.PARAMETER MachineAccessData
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsCltAgentgroup -AgentGroupId $agentgroupid -Organization $organization -ApiVersion $apiversion

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentGroupName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentGroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $MachineSetupInput,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $OutgoingRequestUrls,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $MachineAccessData,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'AgentGroupName' = 'agentGroupName'
            'MachineSetupInput' = 'machineSetupInput'
            'OutgoingRequestUrls' = 'outgoingRequestUrls'
            'MachineAccessData' = 'machineAccessData'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('AgentGroupName','MachineSetupInput','OutgoingRequestUrls','MachineAccessData','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/agentgroups/{agentGroupId}' -Replace '{agentGroupId}',$AgentGroupId -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}