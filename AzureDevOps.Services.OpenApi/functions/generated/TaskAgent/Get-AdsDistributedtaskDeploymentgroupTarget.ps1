function Get-AdsDistributedtaskDeploymentgroupTarget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of deployment targets in a deployment group.

.PARAMETER TargetId
    ID of the deployment target to return.

.PARAMETER PropertyFilters
    

.PARAMETER DeploymentGroupId
    ID of the deployment group.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER AgentJobResult
    Get only deployment targets that have this last job result.

.PARAMETER Top
    Maximum number of deployment targets to return. Default is **1000**.

.PARAMETER Tags
    Get only the deployment targets that contain all these comma separted list of tags.

.PARAMETER PartialNameMatch
    When set to true, treats **name** as pattern. Else treats it as absolute match. Default is **false**.

.PARAMETER Enabled
    Get only deployment targets that are enabled or disabled. Default is 'null' which returns all the targets.

.PARAMETER Name
    Name pattern of the deployment targets to return.

.PARAMETER Project
    Project ID or project name

.PARAMETER Expand
    Include these additional details in the returned objects.

.PARAMETER ContinuationToken
    Get deployment targets with names greater than this continuationToken lexicographically.

.PARAMETER AgentStatus
    Get only deployment targets that have this status.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskDeploymentgroupTarget -DeploymentGroupId $deploymentgroupid -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of deployment targets in a deployment group.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskDeploymentgroupTarget -TargetId $targetid -DeploymentGroupId $deploymentgroupid -ApiVersion $apiversion -Project $project -Organization $organization

    Get a deployment target by its ID in a deployment group

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $TargetId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PropertyFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $DeploymentGroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentJobResult,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Tags,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $PartialNameMatch,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Enabled,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentStatus,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'PropertyFilters' = 'propertyFilters'
            'ApiVersion' = 'api-version'
            'AgentJobResult' = 'agentJobResult'
            'Top' = '$top'
            'Tags' = 'tags'
            'PartialNameMatch' = 'partialNameMatch'
            'Enabled' = 'enabled'
            'Name' = 'name'
            'Expand' = '$expand'
            'ContinuationToken' = 'continuationToken'
            'AgentStatus' = 'agentStatus'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PropertyFilters','ApiVersion','AgentJobResult','Top','Tags','PartialNameMatch','Enabled','Name','Expand','ContinuationToken','AgentStatus') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/deploymentgroups/{deploymentGroupId}/targets' -Replace '{deploymentGroupId}',$DeploymentGroupId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($TargetId) { $__path += "/$TargetId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}