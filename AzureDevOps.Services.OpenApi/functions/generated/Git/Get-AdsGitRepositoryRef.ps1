function Get-AdsGitRepositoryRef {
<#
.SYNOPSIS
    

.DESCRIPTION
    Queries the provided repository for its refs and returns them.

.PARAMETER FilterContains
    [optional] A filter to apply to the refs (contains).

.PARAMETER Filter
    [optional] A filter to apply to the refs (starts with).

.PARAMETER PeelTags
    [optional] Annotated tags will populate the PeeledObjectId property. default is false.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Top
    [optional] Maximum number of refs to return. It cannot be bigger than 1000. If it is not provided but continuationToken is, top will default to 100.

.PARAMETER IncludeMyBranches
    [optional] Includes only branches that the user owns, the branches the user favorites, and the default branch. The default value is false. Cannot be combined with the filter parameter.

.PARAMETER Project
    Project ID or project name

.PARAMETER IncludeLinks
    [optional] Specifies if referenceLinks should be included in the result. default is false.

.PARAMETER ContinuationToken
    The continuation token used for pagination.

.PARAMETER IncludeStatuses
    [optional] Includes up to the first 1000 commit statuses for each ref. The default value is false.

.PARAMETER LatestStatusesOnly
    [optional] True to include only the tip commit status for each ref. This option requires `includeStatuses` to be true. The default value is false.

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryRef -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Queries the provided repository for its refs and returns them.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilterContains,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Filter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $PeelTags,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeMyBranches,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeStatuses,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LatestStatusesOnly,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'FilterContains' = 'filterContains'
            'Filter' = 'filter'
            'PeelTags' = 'peelTags'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
            'IncludeMyBranches' = 'includeMyBranches'
            'IncludeLinks' = 'includeLinks'
            'ContinuationToken' = 'continuationToken'
            'IncludeStatuses' = 'includeStatuses'
            'LatestStatusesOnly' = 'latestStatusesOnly'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('FilterContains','Filter','PeelTags','ApiVersion','Top','IncludeMyBranches','IncludeLinks','ContinuationToken','IncludeStatuses','LatestStatusesOnly') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/refs' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}