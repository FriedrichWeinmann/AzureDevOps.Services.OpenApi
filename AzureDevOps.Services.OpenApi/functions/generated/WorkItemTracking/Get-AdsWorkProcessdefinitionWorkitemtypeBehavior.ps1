function Get-AdsWorkProcessdefinitionWorkitemtypeBehavior {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of all behaviors for the work item type of the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER WitRefNameForBehaviors
    Work item type reference name for the behavior

.PARAMETER ProcessId
    The ID of the process

.PARAMETER BehaviorRefName
    The reference name of the behavior

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWorkProcessdefinitionWorkitemtypeBehavior -Organization $organization -WitRefNameForBehaviors $witrefnameforbehaviors -ProcessId $processid -BehaviorRefName $behaviorrefname -ApiVersion $apiversion

    Returns a behavior for the work item type of the process.

.EXAMPLE
    PS C:\> Get-AdsWorkProcessdefinitionWorkitemtypeBehavior -Organization $organization -WitRefNameForBehaviors $witrefnameforbehaviors -ProcessId $processid -ApiVersion $apiversion

    Returns a list of all behaviors for the work item type of the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get Behavior For Work Item Type')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get Behavior For Work Item Type')]
        [string]
        $WitRefNameForBehaviors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get Behavior For Work Item Type')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get Behavior For Work Item Type')]
        [string]
        $BehaviorRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get Behavior For Work Item Type')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workitemtypes/{witRefNameForBehaviors}/behaviors' -Replace '{organization}',$Organization -Replace '{witRefNameForBehaviors}',$WitRefNameForBehaviors -Replace '{processId}',$ProcessId
        if ($BehaviorRefName) { $__path += "/$BehaviorRefName" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}