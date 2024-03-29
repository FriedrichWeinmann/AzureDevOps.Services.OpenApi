﻿function Get-AdsReleaseReleaseManualintervention {
<#
.SYNOPSIS
    

.DESCRIPTION
    List all manual interventions for a given release.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ManualInterventionId
    Id of the manual intervention.

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseManualintervention -Organization $organization -ManualInterventionId $manualinterventionid -ReleaseId $releaseid -Project $project -ApiVersion $apiversion

    Get manual intervention for a given release and manual intervention id.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseManualintervention -Organization $organization -ReleaseId $releaseid -Project $project -ApiVersion $apiversion

    List all manual interventions for a given release.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Manual Interventions_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Manual Interventions_Get')]
        [string]
        $ManualInterventionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Manual Interventions_Get')]
        [string]
        $ReleaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Manual Interventions_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Manual Interventions_Get')]
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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/Release/releases/{releaseId}/manualinterventions' -Replace '{organization}',$Organization -Replace '{releaseId}',$ReleaseId -Replace '{project}',$Project
        if ($ManualInterventionId) { $__path += "/$ManualInterventionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}