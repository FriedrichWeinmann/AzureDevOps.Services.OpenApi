function Get-AdsPackagingFeedNugetPackageVersion {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get information about a package version.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER FeedId
    Name or ID of the feed.

.PARAMETER PackageVersion
    Version of the package.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ShowDeleted
    True to include deleted packages in the response.

.PARAMETER Project
    Project ID or project name

.PARAMETER PackageName
    Name of the package.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedNugetPackageVersion -FeedId $feedid -PackageVersion $packageversion -ApiVersion $apiversion -Organization $organization -Project $project -PackageName $packagename

    Get information about a package version.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
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

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ShowDeleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PackageName
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'ShowDeleted' = 'showDeleted'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','ShowDeleted') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feedId}/nuget/packages/{packageName}/versions/{packageVersion}' -Replace '{feedId}',$FeedId -Replace '{packageVersion}',$PackageVersion -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{packageName}',$PackageName

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}