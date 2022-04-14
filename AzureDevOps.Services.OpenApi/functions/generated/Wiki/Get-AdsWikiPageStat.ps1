function Get-AdsWikiPageStat {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns page detail corresponding to Page ID.

.PARAMETER WikiIdentifier
    Wiki ID or wiki name.

.PARAMETER PageViewsForDays
    last N days from the current day for which page views is to be returned. It's inclusive of current day.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PageId
    Wiki page ID.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWikiPageStat -WikiIdentifier $wikiidentifier -Project $project -Organization $organization -PageId $pageid -ApiVersion $apiversion

    Returns page detail corresponding to Page ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WikiIdentifier,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PageViewsForDays,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PageId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'PageViewsForDays' = 'pageViewsForDays'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PageViewsForDays','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages/{pageId}/stats' -Replace '{wikiIdentifier}',$WikiIdentifier -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{pageId}',$PageId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}