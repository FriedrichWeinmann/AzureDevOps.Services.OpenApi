function Remove-AdsDistributedtaskDeploymentgroupTarget {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a deployment target in a deployment group. This deletes the agent from associated deployment pool too.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DeploymentGroupId
    ID of the deployment group in which deployment target is deleted.

.PARAMETER TargetId
    ID of the deployment target to delete.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsDistributedtaskDeploymentgroupTarget -Organization $organization -DeploymentGroupId $deploymentgroupid -TargetId $targetid -Project $project -ApiVersion $apiversion

    Delete a deployment target in a deployment group. This deletes the agent from associated deployment pool too.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DeploymentGroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/deploymentgroups/{deploymentGroupId}/targets/{targetId}' -Replace '{organization}',$Organization -Replace '{deploymentGroupId}',$DeploymentGroupId -Replace '{targetId}',$TargetId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}