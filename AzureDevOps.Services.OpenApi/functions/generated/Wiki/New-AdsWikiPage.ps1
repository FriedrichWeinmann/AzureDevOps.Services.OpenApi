function New-AdsWikiPage {
<#
.SYNOPSIS
    Creates or edits a wiki page.

.DESCRIPTION
    Creates or edits a wiki page.

.PARAMETER Version
    Version of the page on which the change is to be made. Mandatory for `Edit` scenario. To be populated in the If-Match header of the request.

.PARAMETER Path
    Wiki page path.

.PARAMETER Comment
    Comment to be associated with the page operation.

.PARAMETER WikiIdentifier
    Wiki ID or wiki name.

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

.PARAMETER FilterVersion
    Version string identifier (name of tag/branch, SHA1 of commit)

.EXAMPLE
    PS C:\> New-AdsWikiPage -Version $version

    <insert description here>

.EXAMPLE
    PS C:\> New-AdsWikiPage -Path $path -WikiIdentifier $wikiidentifier -Project $project -Organization $organization -ApiVersion $apiversion

    Creates or edits a wiki page.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Wikis_Get')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Comment,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WikiIdentifier,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilterVersion
    )
    process {
        $__mapping = @{
            'Version' = 'Version'
            'Path' = 'path'
            'Comment' = 'comment'
            'VersionType' = 'versionDescriptor.versionType'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'ApiVersion' = 'api-version'
            'FilterVersion' = 'versionDescriptor.version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Path','Comment','VersionType','VersionOptions','ApiVersion','FilterVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @('Version') -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages' -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}