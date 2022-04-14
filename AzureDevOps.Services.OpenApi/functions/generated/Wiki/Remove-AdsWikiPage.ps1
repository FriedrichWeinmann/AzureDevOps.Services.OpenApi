function Remove-AdsWikiPage {
<#
.SYNOPSIS
    Deletes a wiki page.

.DESCRIPTION
    Deletes a wiki page.

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER Path
    Wiki page path.

.PARAMETER Comment
    Comment to be associated with this page delete.

.PARAMETER WikiIdentifier
    Wiki ID or wiki name.

.PARAMETER Id
    Wiki page ID.

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER VersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsWikiPage -WikiIdentifier $wikiidentifier -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Deletes a wiki page.

.EXAMPLE
    PS C:\> Remove-AdsWikiPage -Path $path -WikiIdentifier $wikiidentifier -Project $project -Organization $organization -ApiVersion $apiversion

    Deletes a wiki page.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Delete Page By Id')]
        [string]
        $Comment,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Delete Page By Id')]
        [string]
        $WikiIdentifier,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Delete Page By Id')]
        [string]
        $Id,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Delete Page By Id')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Delete Page By Id')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Delete Page By Id')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Version' = 'versionDescriptor.version'
            'Path' = 'path'
            'Comment' = 'comment'
            'VersionType' = 'versionDescriptor.versionType'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Version','Path','Comment','VersionType','VersionOptions','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages' -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($Id) { $__path += "/$Id" }

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}