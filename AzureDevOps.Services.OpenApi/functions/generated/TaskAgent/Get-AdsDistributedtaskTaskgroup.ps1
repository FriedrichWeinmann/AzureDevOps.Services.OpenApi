function Get-AdsDistributedtaskTaskgroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    List task groups.

.PARAMETER ContinuationToken
    Gets the task groups after the continuation token provided.

.PARAMETER Expanded
    'true' to recursively expand task groups. Default is 'false'.

.PARAMETER QueryOrder
    Gets the results in the defined order. Default is 'CreatedOnDescending'.

.PARAMETER Deleted
    'true'to include deleted task groups. Default is 'false'.

.PARAMETER TaskGroupId
    Id of the task group.

.PARAMETER Top
    Number of task groups to get.

.PARAMETER TaskIdFilter
    Guid of the taskId to filter.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskTaskgroup -TaskGroupId $taskgroupid -ApiVersion $apiversion -Organization $organization -Project $project

    List task groups.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Expanded,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Deleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskGroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskIdFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Expanded' = 'expanded'
            'QueryOrder' = 'queryOrder'
            'Deleted' = 'deleted'
            'Top' = '$top'
            'TaskIdFilter' = 'taskIdFilter'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Expanded','QueryOrder','Deleted','Top','TaskIdFilter','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/taskgroups/{taskGroupId}' -Replace '{taskGroupId}',$TaskGroupId -Replace '{organization}',$Organization -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}