function Set-AdsWorkProcesseWorkitemtypesbehaviorBehavior {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates a behavior for the work item type of the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER WitRefNameForBehaviors
    Work item type reference name for the behavior

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsWorkProcesseWorkitemtypesbehaviorBehavior -Organization $organization -WitRefNameForBehaviors $witrefnameforbehaviors -ProcessId $processid -ApiVersion $apiversion

    Updates a behavior for the work item type of the process.

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
        $WitRefNameForBehaviors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workitemtypesbehaviors/{witRefNameForBehaviors}/behaviors' -Replace '{organization}',$Organization -Replace '{witRefNameForBehaviors}',$WitRefNameForBehaviors -Replace '{processId}',$ProcessId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}