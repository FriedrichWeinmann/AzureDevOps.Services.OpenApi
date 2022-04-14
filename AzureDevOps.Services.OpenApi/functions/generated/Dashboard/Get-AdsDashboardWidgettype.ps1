function Get-AdsDashboardWidgettype {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all available widget metadata in alphabetical order, including widgets marked with isVisibleFromCatalog == false.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ContributionId
    The ID of Contribution for the Widget

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Scope
    

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Get-AdsDashboardWidgettype -ApiVersion $apiversion -Organization $organization -Scope $scope -Project $project

    Get all available widget metadata in alphabetical order, including widgets marked with isVisibleFromCatalog == false.

.EXAMPLE
    PS C:\> Get-AdsDashboardWidgettype -ApiVersion $apiversion -ContributionId $contributionid -Organization $organization -Project $project

    Get the widget metadata satisfying the specified contribution ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $ContributionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Scope,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Widget Types_Get Widget Metadata')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Scope' = '$scope'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Scope') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/dashboard/widgettypes' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($ContributionId) { $__path += "/$ContributionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}