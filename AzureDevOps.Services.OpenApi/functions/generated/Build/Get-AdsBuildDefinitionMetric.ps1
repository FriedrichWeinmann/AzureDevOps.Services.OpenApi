﻿function Get-AdsBuildDefinitionMetric {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets build metrics for a definition.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER MinMetricsTime
    The date from which to calculate metrics.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinitionMetric -Organization $organization -DefinitionId $definitionid -Project $project -ApiVersion $apiversion

    Gets build metrics for a definition.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinMetricsTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'MinMetricsTime' = 'minMetricsTime'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('MinMetricsTime','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions/{definitionId}/metrics' -Replace '{organization}',$Organization -Replace '{definitionId}',$DefinitionId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}