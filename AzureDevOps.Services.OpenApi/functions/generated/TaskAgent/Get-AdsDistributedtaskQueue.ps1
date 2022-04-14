function Get-AdsDistributedtaskQueue {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of agent queues by pool ids

.PARAMETER ActionFilter
    Filter by whether the calling user has use or manage permissions

.PARAMETER PoolIds
    A comma-separated list of pool ids to get the corresponding queues for

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER QueueId
    The agent queue to get information about

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskQueue -PoolIds $poolids -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of agent queues by pool ids

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskQueue -ApiVersion $apiversion -QueueId $queueid -Project $project -Organization $organization

    Get information about an agent queue.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queues_Get')]
        [string]
        $ActionFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PoolIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queues_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queues_Get')]
        [string]
        $QueueId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queues_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queues_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ActionFilter' = 'actionFilter'
            'PoolIds' = 'poolIds'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ActionFilter','PoolIds','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/queues' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($QueueId) { $__path += "/$QueueId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}