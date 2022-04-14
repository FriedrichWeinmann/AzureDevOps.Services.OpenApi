function Get-AdsDistributedtaskDeploymentgroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of deployment groups by name or IDs.

.PARAMETER ContinuationToken
    Get deployment groups with names greater than this continuationToken lexicographically.

.PARAMETER Expand
    Include these additional details in the returned objects.

.PARAMETER ActionFilter
    Get only deployment groups on which this action can be performed.

.PARAMETER Name
    Name of the deployment group.

.PARAMETER Ids
    Comma separated list of IDs of the deployment groups.

.PARAMETER Top
    Maximum number of deployment groups to return. Default is **1000**.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DeploymentGroupId
    ID of the deployment group.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskDeploymentgroup -Project $project -Organization $organization -ApiVersion $apiversion

    Get a list of deployment groups by name or IDs.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskDeploymentgroup -Project $project -Organization $organization -DeploymentGroupId $deploymentgroupid -ApiVersion $apiversion

    Get a deployment group by its ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Deploymentgroups_Get')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Deploymentgroups_Get')]
        [string]
        $ActionFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Ids,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Deploymentgroups_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Deploymentgroups_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Deploymentgroups_Get')]
        [string]
        $DeploymentGroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Deploymentgroups_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Expand' = '$expand'
            'ActionFilter' = 'actionFilter'
            'Name' = 'name'
            'Ids' = 'ids'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Expand','ActionFilter','Name','Ids','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/deploymentgroups' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($DeploymentGroupId) { $__path += "/$DeploymentGroupId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}