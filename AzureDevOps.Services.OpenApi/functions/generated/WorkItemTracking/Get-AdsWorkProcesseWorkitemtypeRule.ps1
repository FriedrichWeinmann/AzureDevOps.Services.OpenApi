function Get-AdsWorkProcesseWorkitemtypeRule {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of all rules in the work item type of the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProcessId
    The ID of the process

.PARAMETER RuleId
    The ID of the rule

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseWorkitemtypeRule -Organization $organization -ProcessId $processid -RuleId $ruleid -WitRefName $witrefname -ApiVersion $apiversion

    Returns a single rule in the work item type of the process.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseWorkitemtypeRule -Organization $organization -ProcessId $processid -WitRefName $witrefname -ApiVersion $apiversion

    Returns a list of all rules in the work item type of the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Rules_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Rules_Get')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Rules_Get')]
        [string]
        $RuleId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Rules_Get')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Rules_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/rules' -Replace '{organization}',$Organization -Replace '{processId}',$ProcessId -Replace '{witRefName}',$WitRefName
        if ($RuleId) { $__path += "/$RuleId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}