function Move-AdsWikiPage {
<#
.SYNOPSIS
    Creates a page move operation that updates the path and order of the page

.DESCRIPTION
    Creates a page move operation that updates the path and order of the page as provided in the parameters.

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER Comment
    Comment that is to be associated with this page move.

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
    PS C:\> Move-AdsWikiPage -WikiIdentifier $wikiidentifier -Project $project -Organization $organization -ApiVersion $apiversion

    Creates a page move operation that updates the path and order of the page as provided in the parameters.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Comment,

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
            'Comment' = 'comment'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Version','VersionType','Comment','VersionOptions','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pagemoves' -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}