function Get-AdsWitWorkitemRevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns the list of fully hydrated work item revisions, paged.

.PARAMETER RevisionNumber
    

.PARAMETER Skip
    

.PARAMETER Expand
    

.PARAMETER Id
    

.PARAMETER Top
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemRevision -RevisionNumber $revisionnumber -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Returns a fully hydrated work item for the requested revision

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemRevision -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Returns the list of fully hydrated work item revisions, paged.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $RevisionNumber,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $Id,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'Expand' = '$expand'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','Expand','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{id}/revisions' -Replace '{id}',$Id -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($RevisionNumber) { $__path += "/$RevisionNumber" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}