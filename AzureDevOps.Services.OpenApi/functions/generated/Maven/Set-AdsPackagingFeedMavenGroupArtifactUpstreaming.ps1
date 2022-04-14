function Set-AdsPackagingFeedMavenGroupArtifactUpstreaming {
<#
.SYNOPSIS
    

.DESCRIPTION
    Set the upstreaming behavior of a package within the context of a feed

The package does not need to necessarily exist in the feed prior to setting the behavior.
This assists with packages that are not yet ingested from an upstream, yet the feed owner wants
to apply a specific behavior on the first ingestion.

.PARAMETER Feed
    The name or id of the feed

.PARAMETER GroupId
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ArtifactId
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsPackagingFeedMavenGroupArtifactUpstreaming -Feed $feed -GroupId $groupid -ApiVersion $apiversion -ArtifactId $artifactid -Project $project -Organization $organization

    Set the upstreaming behavior of a package within the context of a feed

The package does not need to necessarily exist in the feed prior to setting the behavior.
This assists with packages that are not yet ingested from an upstream, yet the feed owner wants
to apply a specific behavior on the first ingestion.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Feed,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

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
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://pkgs.dev.azure.com/{organization}/{project}/_apis/packaging/feeds/{feed}/maven/groups/{groupId}/artifacts/{artifactId}/upstreaming' -Replace '{feed}',$Feed -Replace '{groupId}',$GroupId -Replace '{artifactId}',$ArtifactId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}