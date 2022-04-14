function Get-AdsTfvcChangeset {
<#
.SYNOPSIS
    Retrieve Tfvc Changesets

.DESCRIPTION
    Retrieve Tfvc Changesets

.PARAMETER FromId
    If provided, only include changesets after this changesetID.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeDetails
    Include policy details and check-in notes in the response. Default: false

.PARAMETER MaxCommentLength
    Include details about associated work items in the response. Default: null

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IncludeWorkItems
    Include workitems. Default: false

.PARAMETER Skip
    Number of results to skip. Default: null

.PARAMETER FromDate
    If provided, only include changesets created after this date (string).

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references.

.PARAMETER Top
    The maximum number of results to return. Default: null

.PARAMETER FollowRenames
    Whether or not to follow renames for the given item being queried.

.PARAMETER Mappings
    Following criteria available (.itemPath, .version, .versionType, .versionOption, .author, .fromId, .toId, .fromDate, .toDate) Default: null

.PARAMETER Id
    Changeset Id to retrieve.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER ItemPath
    Path of item to search under.

.PARAMETER Author
    Alias or display name of user who made the changes.

.PARAMETER Orderby
    Results are sorted by ID in descending order by default. Use id asc to sort by ID in ascending order.

.PARAMETER IncludeSourceRename
    Include renames.  Default: false

.PARAMETER MaxChangeCount
    Number of changes to return (maximum 100 changes) Default: 0

.PARAMETER ToId
    If provided, a version descriptor for the latest change list to include.

.PARAMETER ToDate
    If provided, only include changesets created before this date (string).

.EXAMPLE
    PS C:\> Get-AdsTfvcChangeset -ApiVersion $apiversion -Id $id -Organization $organization -Project $project

    Retrieve a Tfvc Changeset

.EXAMPLE
    PS C:\> Get-AdsTfvcChangeset -ApiVersion $apiversion -Organization $organization -Project $project

    Retrieve Tfvc Changesets

Note: This is a new version of the GetChangesets API that doesn't expose the unneeded queryParams
present in the 1.0 version of the API.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $FromId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $MaxCommentLength,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeWorkItems,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $FromDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $FollowRenames,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [array]
        $Mappings,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $ItemPath,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Author,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $Orderby,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [boolean]
        $IncludeSourceRename,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $MaxChangeCount,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [int32]
        $ToId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Changesets_Get')]
        [string]
        $ToDate
    )
    process {
        $__mapping = @{
            'FromId' = 'searchCriteria.fromId'
            'MaxChangeCount' = 'maxChangeCount'
            'IncludeSourceRename' = 'includeSourceRename'
            'Orderby' = '$orderby'
            'Author' = 'searchCriteria.author'
            'ItemPath' = 'searchCriteria.itemPath'
            'ApiVersion' = 'api-version'
            'Mappings' = 'searchCriteria.mappings'
            'ToId' = 'searchCriteria.toId'
            'FollowRenames' = 'searchCriteria.followRenames'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'FromDate' = 'searchCriteria.fromDate'
            'Skip' = '$skip'
            'IncludeWorkItems' = 'includeWorkItems'
            'MaxCommentLength' = 'maxCommentLength'
            'IncludeDetails' = 'includeDetails'
            'Top' = '$top'
            'ToDate' = 'searchCriteria.toDate'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('FromId','MaxChangeCount','IncludeSourceRename','Orderby','Author','ItemPath','ApiVersion','Mappings','ToId','FollowRenames','IncludeLinks','FromDate','Skip','IncludeWorkItems','MaxCommentLength','IncludeDetails','Top','ToDate') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/changesets' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($Id) { $__path += "/$Id" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}