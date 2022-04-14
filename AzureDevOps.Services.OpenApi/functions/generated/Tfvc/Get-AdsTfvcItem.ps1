function Get-AdsTfvcItem {
<#
.SYNOPSIS
    Get a list of Tfvc items

.DESCRIPTION
    Get a list of Tfvc items

.PARAMETER VersionType
    

.PARAMETER IncludeLinks
    True to include links.

.PARAMETER ScopePath
    Version control path of a folder to return multiple items.

.PARAMETER Version
    Version object.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER VersionOption
    

.PARAMETER Project
    Project ID or project name

.PARAMETER RecursionLevel
    None (just the item), or OneLevel (contents of a folder).

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTfvcItem -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of Tfvc items

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopePath,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOption,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RecursionLevel,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'VersionType' = 'versionDescriptor.versionType'
            'IncludeLinks' = 'includeLinks'
            'ScopePath' = 'scopePath'
            'Version' = 'versionDescriptor.version'
            'ApiVersion' = 'api-version'
            'VersionOption' = 'versionDescriptor.versionOption'
            'RecursionLevel' = 'recursionLevel'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('VersionType','IncludeLinks','ScopePath','Version','ApiVersion','VersionOption','RecursionLevel') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/items' -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}