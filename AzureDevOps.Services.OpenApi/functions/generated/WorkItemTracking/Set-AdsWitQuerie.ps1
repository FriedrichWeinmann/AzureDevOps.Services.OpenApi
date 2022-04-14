function Set-AdsWitQuerie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update a query or a folder. This allows you to update, rename and move queries and folders.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER UndeleteDescendants
    Undelete the children of this folder. It is important to note that this will not bring back the permission changes that were previously applied to the descendants.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Query
    The ID or path for the query to update.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Set-AdsWitQuerie -ApiVersion $apiversion -Organization $organization -Query $query -Project $project

    Update a query or a folder. This allows you to update, rename and move queries and folders.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $UndeleteDescendants,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Query,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'UndeleteDescendants' = '$undeleteDescendants'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','UndeleteDescendants') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/queries/{query}' -Replace '{organization}',$Organization -Replace '{query}',$Query -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}