function Get-AdsTfvcItem {
<#
.SYNOPSIS
    Get a list of Tfvc items

.DESCRIPTION
    Get a list of Tfvc items

.PARAMETER Version
    Version object.

.PARAMETER VersionType
    

.PARAMETER IncludeLinks
    True to include links.

.PARAMETER VersionOption
    

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RecursionLevel
    None (just the item), or OneLevel (contents of a folder).

.PARAMETER ScopePath
    Version control path of a folder to return multiple items.

.EXAMPLE
    PS C:\> Get-AdsTfvcItem -Project $project -ApiVersion $apiversion -Organization $organization

    Get a list of Tfvc items

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
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $VersionOption,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RecursionLevel,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopePath
    )
    process {
        $__mapping = @{
            'Version' = 'versionDescriptor.version'
            'VersionType' = 'versionDescriptor.versionType'
            'IncludeLinks' = 'includeLinks'
            'VersionOption' = 'versionDescriptor.versionOption'
            'ApiVersion' = 'api-version'
            'RecursionLevel' = 'recursionLevel'
            'ScopePath' = 'scopePath'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Version','VersionType','IncludeLinks','VersionOption','ApiVersion','RecursionLevel','ScopePath') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/items' -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}