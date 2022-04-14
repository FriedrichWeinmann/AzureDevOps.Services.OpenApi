function Get-AdsPackagingFeedPermission {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the permissions for a feed.

The project parameter must be supplied if the feed was created in a project.
If the feed is not associated with any project, omit the project parameter from the request.

.PARAMETER FeedId
    Name or Id of the feed.

.PARAMETER IncludeDeletedFeeds
    If includeDeletedFeeds is true, then feedId must be specified by name and not by Guid.

.PARAMETER IdentityDescriptor
    Filter permissions to the provided identity.

.PARAMETER IncludeIds
    True to include user Ids in the response.  Default is false.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ExcludeInheritedPermissions
    True to only return explicitly set permissions on the feed.  Default is false.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPackagingFeedPermission -FeedId $feedid -ApiVersion $apiversion -Project $project -Organization $organization

    Get the permissions for a feed.

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

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDeletedFeeds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IdentityDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ExcludeInheritedPermissions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeDeletedFeeds' = 'includeDeletedFeeds'
            'IdentityDescriptor' = 'identityDescriptor'
            'IncludeIds' = 'includeIds'
            'ApiVersion' = 'api-version'
            'ExcludeInheritedPermissions' = 'excludeInheritedPermissions'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeDeletedFeeds','IdentityDescriptor','IncludeIds','ApiVersion','ExcludeInheritedPermissions') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://feeds.dev.azure.com/{organization}/{project}/_apis/packaging/Feeds/{feedId}/permissions' -Replace '{feedId}',$FeedId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}