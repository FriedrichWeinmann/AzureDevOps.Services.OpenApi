function Remove-AdsWorkProcessdefinitionWorkitemtypeBehavior {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a behavior for the work item type of the process.

.PARAMETER WitRefNameForBehaviors
    Work item type reference name for the behavior

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.PARAMETER BehaviorRefName
    The reference name of the behavior

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Remove-AdsWorkProcessdefinitionWorkitemtypeBehavior -WitRefNameForBehaviors $witrefnameforbehaviors -ProcessId $processid -ApiVersion $apiversion -BehaviorRefName $behaviorrefname -Organization $organization

    Removes a behavior for the work item type of the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefNameForBehaviors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BehaviorRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workitemtypes/{witRefNameForBehaviors}/behaviors/{behaviorRefName}' -Replace '{witRefNameForBehaviors}',$WitRefNameForBehaviors -Replace '{processId}',$ProcessId -Replace '{behaviorRefName}',$BehaviorRefName -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}