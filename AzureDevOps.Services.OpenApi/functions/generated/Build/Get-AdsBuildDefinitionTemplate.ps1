﻿function Get-AdsBuildDefinitionTemplate {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets all definition templates.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TemplateId
    The ID of the requested template.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinitionTemplate -Organization $organization -TemplateId $templateid -Project $project -ApiVersion $apiversion

    Gets a specific build definition template.

.EXAMPLE
    PS C:\> Get-AdsBuildDefinitionTemplate -Organization $organization -Project $project -ApiVersion $apiversion

    Gets all definition templates.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $TemplateId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Templates_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions/templates' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($TemplateId) { $__path += "/$TemplateId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}