function Get-AdsPackagingFeedNpmPackageVersionContent {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER UnscopedPackageName
    

.PARAMETER Project
    Project ID or project name

.PARAMETER FeedId
    

.PARAMETER PackageVersion
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PackageScope
    

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedNpmPackageVersionContent -UnscopedPackageName $unscopedpackagename -Project $project -FeedId $feedid -PackageVersion $packageversion -ApiVersion $apiversion -Organization $organization -PackageScope $packagescope

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $UnscopedPackageName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FeedId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageScope
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feedId}/npm/packages/@{packageScope}/{unscopedPackageName}/versions/{packageVersion}/content' -Replace '{unscopedPackageName}',$UnscopedPackageName -Replace '{project}',$Project -Replace '{feedId}',$FeedId -Replace '{packageVersion}',$PackageVersion -Replace '{organization}',$Organization -Replace '{packageScope}',$PackageScope

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}