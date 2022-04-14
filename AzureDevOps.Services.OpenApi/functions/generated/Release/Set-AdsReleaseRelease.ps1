function Set-AdsReleaseRelease {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update few properties of a release.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ReleaseId
    Id of the release to update.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.8' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsReleaseRelease -Organization $organization -ReleaseId $releaseid -Project $project -ApiVersion $apiversion

    Update few properties of a release.

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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases/{releaseId}' -Replace '{organization}',$Organization -Replace '{releaseId}',$ReleaseId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}