﻿function Remove-AdsBuildBuildTag {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a tag from a build. NOTE: This API will not work for tags with special characters. To remove tags with special characters, use the PATCH method instead (in 6.0+)

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Tag
    The tag to remove.

.PARAMETER Project
    Project ID or project name

.PARAMETER BuildId
    The ID of the build.

.EXAMPLE
    PS C:\> Remove-AdsBuildBuildTag -Organization $organization -ApiVersion $apiversion -Tag $tag -Project $project -BuildId $buildid

    Removes a tag from a build. NOTE: This API will not work for tags with special characters. To remove tags with special characters, use the PATCH method instead (in 6.0+)

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Tag,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/builds/{buildId}/tags/{tag}' -Replace '{organization}',$Organization -Replace '{tag}',$Tag -Replace '{project}',$Project -Replace '{buildId}',$BuildId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}