function Get-AdsReleaseReleaseEnvironment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a release environment.

.PARAMETER Expand
    A property that should be expanded in the environment.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.PARAMETER EnvironmentId
    Id of the release environment.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseEnvironment -Project $project -ReleaseId $releaseid -Organization $organization -ApiVersion $apiversion -EnvironmentId $environmentid

    Get a release environment.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EnvironmentId
    )
    process {
        $__mapping = @{
            'Expand' = '$expand'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expand','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/Release/releases/{releaseId}/environments/{environmentId}' -Replace '{project}',$Project -Replace '{releaseId}',$ReleaseId -Replace '{organization}',$Organization -Replace '{environmentId}',$EnvironmentId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}