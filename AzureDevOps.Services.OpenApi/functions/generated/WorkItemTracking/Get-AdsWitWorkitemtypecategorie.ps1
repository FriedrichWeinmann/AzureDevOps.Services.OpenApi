function Get-AdsWitWorkitemtypecategorie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all work item type categories.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Category
    The category name

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemtypecategorie -Organization $organization -Category $category -Project $project -ApiVersion $apiversion

    Get specific work item type category by name.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemtypecategorie -Organization $organization -Project $project -ApiVersion $apiversion

    Get all work item type categories.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Type Categories_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Type Categories_Get')]
        [string]
        $Category,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Type Categories_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Type Categories_Get')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workitemtypecategories' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($Category) { $__path += "/$Category" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}