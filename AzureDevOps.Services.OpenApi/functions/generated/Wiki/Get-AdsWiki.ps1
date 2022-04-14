function Get-AdsWiki {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets all wikis in a project or collection.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER WikiIdentifier
    Wiki ID or wiki name.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWiki -Organization $organization -WikiIdentifier $wikiidentifier -Project $project -ApiVersion $apiversion

    Gets the wiki corresponding to the wiki ID or wiki name provided.

.EXAMPLE
    PS C:\> Get-AdsWiki -Organization $organization -Project $project -ApiVersion $apiversion

    Gets all wikis in a project or collection.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Wikis_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Wikis_Get')]
        [string]
        $WikiIdentifier,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Wikis_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Wikis_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wiki/wikis' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($WikiIdentifier) { $__path += "/$WikiIdentifier" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}