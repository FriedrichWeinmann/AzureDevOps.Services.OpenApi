function Set-AdsWikiPagesbatch {
<#
.SYNOPSIS
    Returns pageable list of Wiki Pages

.DESCRIPTION
    Returns pageable list of Wiki Pages

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER WikiIdentifier
    Wiki ID or wiki name.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER VersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsWikiPagesbatch -WikiIdentifier $wikiidentifier -Project $project -Organization $organization -ApiVersion $apiversion

    Returns pageable list of Wiki Pages

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WikiIdentifier,

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
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Version' = 'versionDescriptor.version'
            'VersionType' = 'versionDescriptor.versionType'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Version','VersionType','VersionOptions','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pagesbatch' -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}