﻿function New-AdsWorkProcesseWorkitemtypeRule {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates a rule in the work item type of the process.

.PARAMETER RuleId
    The ID of the rule

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> New-AdsWorkProcesseWorkitemtypeRule -RuleId $ruleid -ProcessId $processid -ApiVersion $apiversion -WitRefName $witrefname -Organization $organization

    Updates a rule in the work item type of the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RuleId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/rules/{ruleId}' -Replace '{ruleId}',$RuleId -Replace '{processId}',$ProcessId -Replace '{witRefName}',$WitRefName -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}