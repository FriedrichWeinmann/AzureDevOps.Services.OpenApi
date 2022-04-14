function Get-AdsWorkProcesseWorkitemtypesbehaviorBehavior {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of all behaviors for the work item type of the process.

.PARAMETER WitRefNameForBehaviors
    Work item type reference name for the behavior

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER BehaviorRefName
    The reference name of the behavior

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseWorkitemtypesbehaviorBehavior -WitRefNameForBehaviors $witrefnameforbehaviors -ProcessId $processid -ApiVersion $apiversion -BehaviorRefName $behaviorrefname -Organization $organization

    Returns a behavior for the work item type of the process.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseWorkitemtypesbehaviorBehavior -WitRefNameForBehaviors $witrefnameforbehaviors -ProcessId $processid -ApiVersion $apiversion -Organization $organization

    Returns a list of all behaviors for the work item type of the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Types Behaviors_Get')]
        [string]
        $WitRefNameForBehaviors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Types Behaviors_Get')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Types Behaviors_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Types Behaviors_Get')]
        [string]
        $BehaviorRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Types Behaviors_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workitemtypesbehaviors/{witRefNameForBehaviors}/behaviors' -Replace '{witRefNameForBehaviors}',$WitRefNameForBehaviors -Replace '{processId}',$ProcessId -Replace '{organization}',$Organization
        if ($BehaviorRefName) { $__path += "/$BehaviorRefName" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}