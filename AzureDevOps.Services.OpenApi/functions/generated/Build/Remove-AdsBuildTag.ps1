﻿function Remove-AdsBuildTag {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a tag from builds, definitions, and from the tag store

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Tag
    The tag to remove.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Remove-AdsBuildTag -ApiVersion $apiversion -Organization $organization -Tag $tag -Project $project

    Removes a tag from builds, definitions, and from the tag store

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
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Tag,

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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/tags/{tag}' -Replace '{organization}',$Organization -Replace '{tag}',$Tag -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}