function Get-AdsTfvcChangeset {
<#
.SYNOPSIS
    Retrieve Tfvc Changesets

.DESCRIPTION
    Retrieve Tfvc Changesets

.PARAMETER ToDate
    If provided, only include changesets created before this date (string).

.PARAMETER MaxChangeCount
    Number of changes to return (maximum 100 changes) Default: 0

.PARAMETER Orderby
    Results are sorted by ID in descending order by default. Use id asc to sort by ID in ascending order.

.PARAMETER IncludeWorkItems
    Include workitems. Default: false

.PARAMETER ItemPath
    Path of item to search under.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeSourceRename
    Include renames.  Default: false

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references.

.PARAMETER Skip
    Number of results to skip. Default: null

.PARAMETER Author
    Alias or display name of user who made the changes.

.PARAMETER FromDate
    If provided, only include changesets created after this date (string).

.PARAMETER IncludeDetails
    Include policy details and check-in notes in the response. Default: false

.PARAMETER Top
    The maximum number of results to return. Default: null

.PARAMETER FollowRenames
    Whether or not to follow renames for the given item being queried.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER ToId
    If provided, a version descriptor for the latest change list to include.

.PARAMETER Mappings
    Following criteria available (.itemPath, .version, .versionType, .versionOption, .author, .fromId, .toId, .fromDate, .toDate) Default: null

.PARAMETER MaxCommentLength
    Include details about associated work items in the response. Default: null

.PARAMETER Id
    Changeset Id to retrieve.

.PARAMETER FromId
    If provided, only include changesets after this changesetID.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTfvcChangeset -ApiVersion $apiversion -Project $project -Organization $organization

    Retrieve Tfvc Changesets

Note: This is a new version of the GetChangesets API that doesn't expose the unneeded queryParams
present in the 1.0 version of the API.

.EXAMPLE
    PS C:\> Get-AdsTfvcChangeset -Id $id -ApiVersion $apiversion -Project $project -Organization $organization

    Retrieve a Tfvc Changeset

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $ToDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $MaxChangeCount,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Orderby,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeWorkItems,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $ItemPath,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeSourceRename,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Author,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $FromDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $FollowRenames,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $ToId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [array]
        $Mappings,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $MaxCommentLength,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Id,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $FromId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ToDate' = 'searchCriteria.toDate'
            'MaxCommentLength' = 'maxCommentLength'
            'Mappings' = 'searchCriteria.mappings'
            'ToId' = 'searchCriteria.toId'
            'ApiVersion' = 'api-version'
            'FollowRenames' = 'searchCriteria.followRenames'
            'Top' = '$top'
            'IncludeDetails' = 'includeDetails'
            'FromId' = 'searchCriteria.fromId'
            'FromDate' = 'searchCriteria.fromDate'
            'Skip' = '$skip'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'IncludeSourceRename' = 'includeSourceRename'
            'ItemPath' = 'searchCriteria.itemPath'
            'IncludeWorkItems' = 'includeWorkItems'
            'Orderby' = '$orderby'
            'MaxChangeCount' = 'maxChangeCount'
            'Author' = 'searchCriteria.author'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ToDate','MaxCommentLength','Mappings','ToId','ApiVersion','FollowRenames','Top','IncludeDetails','FromId','FromDate','Skip','IncludeLinks','IncludeSourceRename','ItemPath','IncludeWorkItems','Orderby','MaxChangeCount','Author') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/changesets' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($Id) { $__path += "/$Id" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}