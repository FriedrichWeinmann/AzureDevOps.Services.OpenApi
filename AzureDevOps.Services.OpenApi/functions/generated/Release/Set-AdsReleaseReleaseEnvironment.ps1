function Set-AdsReleaseReleaseEnvironment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update the status of a release environment

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER EnvironmentId
    Id of release environment.

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsReleaseReleaseEnvironment -Organization $organization -EnvironmentId $environmentid -ReleaseId $releaseid -Project $project -ApiVersion $apiversion

    Update the status of a release environment

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EnvironmentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/Release/releases/{releaseId}/environments/{environmentId}' -Replace '{organization}',$Organization -Replace '{environmentId}',$EnvironmentId -Replace '{releaseId}',$ReleaseId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}