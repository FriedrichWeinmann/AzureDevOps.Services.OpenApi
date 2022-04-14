function Get-AdsWitWorkitemUpdate {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a the deltas between work item revisions

.PARAMETER Skip
    

.PARAMETER Id
    

.PARAMETER UpdateNumber
    

.PARAMETER Top
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemUpdate -Id $id -UpdateNumber $updatenumber -Project $project -Organization $organization -ApiVersion $apiversion

    Returns a single update for a work item

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemUpdate -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Returns a the deltas between work item revisions

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Updates_Get')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Updates_Get')]
        [string]
        $UpdateNumber,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Updates_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Updates_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Updates_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{id}/updates' -Replace '{id}',$Id -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($UpdateNumber) { $__path += "/$UpdateNumber" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}