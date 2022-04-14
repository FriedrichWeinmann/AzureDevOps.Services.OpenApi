function Get-AdsGitRepositoryPush {
<#
.SYNOPSIS
    Retrieves pushes associated with the specified repository.

.DESCRIPTION
    Retrieves pushes associated with the specified repository.

.PARAMETER RefName
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER ToDate
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER IncludeRefUpdates
    If true, include the list of refs that were updated by the push.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Top
    Number of pushes to return.

.PARAMETER FromDate
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER PushId
    ID of the push.

.PARAMETER Skip
    Number of pushes to skip.

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER IncludeCommits
    The number of commits to include in the result.

.PARAMETER Project
    Project ID or project name

.PARAMETER SearchIncludeRefUpdates
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER PusherId
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPush -ApiVersion $apiversion -PushId $pushid -Project $project -RepositoryId $repositoryid -Organization $organization

    Retrieves a particular push.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPush -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Retrieves pushes associated with the specified repository.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ToDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [boolean]
        $IncludeRefUpdates,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FromDate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $PushId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [int32]
        $IncludeCommits,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $SearchIncludeRefUpdates,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PusherId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'RefName' = 'searchCriteria.refName'
            'ToDate' = 'searchCriteria.toDate'
            'IncludeRefUpdates' = 'includeRefUpdates'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
            'FromDate' = 'searchCriteria.fromDate'
            'Skip' = '$skip'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'IncludeCommits' = 'includeCommits'
            'SearchIncludeRefUpdates' = 'searchCriteria.includeRefUpdates'
            'PusherId' = 'searchCriteria.pusherId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('RefName','ToDate','IncludeRefUpdates','ApiVersion','Top','FromDate','Skip','IncludeLinks','IncludeCommits','SearchIncludeRefUpdates','PusherId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pushes' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        if ($PushId) { $__path += "/$PushId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}