﻿function Set-AdsBuildDefinitionPropertie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates properties for a definition.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Set-AdsBuildDefinitionPropertie -ApiVersion $apiversion -DefinitionId $definitionid -Organization $organization -Project $project

    Updates properties for a definition.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions/{definitionId}/properties' -Replace '{definitionId}',$DefinitionId -Replace '{organization}',$Organization -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}