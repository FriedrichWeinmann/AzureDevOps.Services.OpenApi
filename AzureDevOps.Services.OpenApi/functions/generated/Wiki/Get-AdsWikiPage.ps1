function Get-AdsWikiPage {
<#
.SYNOPSIS
    Gets metadata or content of the wiki page for the provided path.

.DESCRIPTION
    Gets metadata or content of the wiki page for the provided path. Content negotiation is done based on the `Accept` header sent in the request.

.PARAMETER RecursionLevel
    Recursion level for subpages retrieval. Defaults to `None` (Optional).

.PARAMETER IncludeContent
    True to include the content of the page in the response for Json content type. Defaults to false (Optional)

.PARAMETER Path
    Wiki page path.

.PARAMETER VersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER VersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Id
    Wiki page ID.

.PARAMETER Project
    Project ID or project name

.PARAMETER WikiIdentifier
    Wiki ID or wiki name.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWikiPage -ApiVersion $apiversion -Project $project -WikiIdentifier $wikiidentifier -Organization $organization

    Gets metadata or content of the wiki page for the provided path. Content negotiation is done based on the `Accept` header sent in the request.

.EXAMPLE
    PS C:\> Get-AdsWikiPage -ApiVersion $apiversion -Id $id -Project $project -WikiIdentifier $wikiidentifier -Organization $organization

    Gets metadata or content of the wiki page for the provided page id. Content negotiation is done based on the `Accept` header sent in the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $RecursionLevel,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [boolean]
        $IncludeContent,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $WikiIdentifier,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'RecursionLevel' = 'recursionLevel'
            'IncludeContent' = 'includeContent'
            'Path' = 'path'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'VersionType' = 'versionDescriptor.versionType'
            'Version' = 'versionDescriptor.version'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('RecursionLevel','IncludeContent','Path','VersionOptions','VersionType','Version','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages' -Replace '{project}',$Project -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{organization}',$Organization
        if ($Id) { $__path += "/$Id" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}