function Get-AdsDashboardWidgettype {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all available widget metadata in alphabetical order, including widgets marked with isVisibleFromCatalog == false.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ContributionId
    The ID of Contribution for the Widget

.PARAMETER Scope
    

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDashboardWidgettype -Organization $organization -ContributionId $contributionid -Project $project -ApiVersion $apiversion

    Get the widget metadata satisfying the specified contribution ID.

.EXAMPLE
    PS C:\> Get-AdsDashboardWidgettype -Organization $organization -Scope $scope -Project $project -ApiVersion $apiversion

    Get all available widget metadata in alphabetical order, including widgets marked with isVisibleFromCatalog == false.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $ContributionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Scope,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Scope' = '$scope'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Scope','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/dashboard/widgettypes' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($ContributionId) { $__path += "/$ContributionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}