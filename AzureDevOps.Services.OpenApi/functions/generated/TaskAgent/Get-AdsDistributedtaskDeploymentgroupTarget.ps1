function Get-AdsDistributedtaskDeploymentgroupTarget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of deployment targets in a deployment group.

.PARAMETER PartialNameMatch
    When set to true, treats **name** as pattern. Else treats it as absolute match. Default is **false**.

.PARAMETER DeploymentGroupId
    ID of the deployment group.

.PARAMETER Name
    Name pattern of the deployment targets to return.

.PARAMETER ContinuationToken
    Get deployment targets with names greater than this continuationToken lexicographically.

.PARAMETER AgentJobResult
    Get only deployment targets that have this last job result.

.PARAMETER Expand
    Include these additional details in the returned objects.

.PARAMETER AgentStatus
    Get only deployment targets that have this status.

.PARAMETER TargetId
    ID of the deployment target to return.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Enabled
    Get only deployment targets that are enabled or disabled. Default is 'null' which returns all the targets.

.PARAMETER PropertyFilters
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Top
    Maximum number of deployment targets to return. Default is **1000**.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Tags
    Get only the deployment targets that contain all these comma separted list of tags.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskDeploymentgroupTarget -DeploymentGroupId $deploymentgroupid -TargetId $targetid -Organization $organization -Project $project -ApiVersion $apiversion

    Get a deployment target by its ID in a deployment group

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskDeploymentgroupTarget -DeploymentGroupId $deploymentgroupid -Organization $organization -Project $project -ApiVersion $apiversion

    Get a list of deployment targets in a deployment group.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $PartialNameMatch,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $DeploymentGroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentJobResult,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AgentStatus,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $TargetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Enabled,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PropertyFilters,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Targets_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Tags
    )
    process {
        $__mapping = @{
            'PartialNameMatch' = 'partialNameMatch'
            'Name' = 'name'
            'ContinuationToken' = 'continuationToken'
            'AgentJobResult' = 'agentJobResult'
            'Expand' = '$expand'
            'AgentStatus' = 'agentStatus'
            'Enabled' = 'enabled'
            'PropertyFilters' = 'propertyFilters'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
            'Tags' = 'tags'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PartialNameMatch','Name','ContinuationToken','AgentJobResult','Expand','AgentStatus','Enabled','PropertyFilters','Top','ApiVersion','Tags') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/deploymentgroups/{deploymentGroupId}/targets' -Replace '{deploymentGroupId}',$DeploymentGroupId -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($TargetId) { $__path += "/$TargetId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}