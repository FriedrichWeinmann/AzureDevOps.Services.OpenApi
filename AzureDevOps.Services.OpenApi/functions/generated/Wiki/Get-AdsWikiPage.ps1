function Get-AdsWikiPage {
<#
.SYNOPSIS
    Gets metadata or content of the wiki page for the provided path.

.DESCRIPTION
    Gets metadata or content of the wiki page for the provided path. Content negotiation is done based on the `Accept` header sent in the request.

.PARAMETER Version
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER Path
    Wiki page path.

.PARAMETER IncludeContent
    True to include the content of the page in the response for Json content type. Defaults to false (Optional)

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

.PARAMETER RecursionLevel
    Recursion level for subpages retrieval. Defaults to `None` (Optional).

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWikiPage -WikiIdentifier $wikiidentifier -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Gets metadata or content of the wiki page for the provided page id. Content negotiation is done based on the `Accept` header sent in the request.

.EXAMPLE
    PS C:\> Get-AdsWikiPage -WikiIdentifier $wikiidentifier -Project $project -Organization $organization -ApiVersion $apiversion

    Gets metadata or content of the wiki page for the provided path. Content negotiation is done based on the `Accept` header sent in the request.

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
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [boolean]
        $IncludeContent,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $WikiIdentifier,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $Id,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOptions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $RecursionLevel,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pages_Get Page By Id')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Version' = 'versionDescriptor.version'
            'Path' = 'path'
            'IncludeContent' = 'includeContent'
            'VersionType' = 'versionDescriptor.versionType'
            'VersionOptions' = 'versionDescriptor.versionOptions'
            'RecursionLevel' = 'recursionLevel'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Version','Path','IncludeContent','VersionType','VersionOptions','RecursionLevel','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages' -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($Id) { $__path += "/$Id" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}