function Get-AdsDistributedtaskTaskgroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    List task groups.

.PARAMETER TaskIdFilter
    Guid of the taskId to filter.

.PARAMETER QueryOrder
    Gets the results in the defined order. Default is 'CreatedOnDescending'.

.PARAMETER ContinuationToken
    Gets the task groups after the continuation token provided.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER TaskGroupId
    Id of the task group.

.PARAMETER Expanded
    'true' to recursively expand task groups. Default is 'false'.

.PARAMETER Top
    Number of task groups to get.

.PARAMETER Deleted
    'true'to include deleted task groups. Default is 'false'.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskTaskgroup -ApiVersion $apiversion -TaskGroupId $taskgroupid -Project $project -Organization $organization

    List task groups.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskIdFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskGroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Expanded,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Deleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'TaskIdFilter' = 'taskIdFilter'
            'QueryOrder' = 'queryOrder'
            'ContinuationToken' = 'continuationToken'
            'ApiVersion' = 'api-version'
            'Expanded' = 'expanded'
            'Top' = '$top'
            'Deleted' = 'deleted'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('TaskIdFilter','QueryOrder','ContinuationToken','ApiVersion','Expanded','Top','Deleted') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/taskgroups/{taskGroupId}' -Replace '{taskGroupId}',$TaskGroupId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}