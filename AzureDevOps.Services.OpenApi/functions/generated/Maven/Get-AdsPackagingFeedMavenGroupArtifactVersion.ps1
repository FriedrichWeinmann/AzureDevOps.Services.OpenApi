function Get-AdsPackagingFeedMavenGroupArtifactVersion {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get information about a package version.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER Version
    Version of the package.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ArtifactId
    Artifact ID of the package.

.PARAMETER Project
    Project ID or project name

.PARAMETER Feed
    Name or ID of the feed.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER GroupId
    Group ID of the package.

.PARAMETER ShowDeleted
    True to show information for deleted packages.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedMavenGroupArtifactVersion -Version $version -ApiVersion $apiversion -ArtifactId $artifactid -Project $project -Feed $feed -Organization $organization -GroupId $groupid

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
        $Version,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Feed,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ShowDeleted
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'ShowDeleted' = 'showDeleted'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','ShowDeleted') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feed}/maven/groups/{groupId}/artifacts/{artifactId}/versions/{version}' -Replace '{version}',$Version -Replace '{artifactId}',$ArtifactId -Replace '{project}',$Project -Replace '{feed}',$Feed -Replace '{organization}',$Organization -Replace '{groupId}',$GroupId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}