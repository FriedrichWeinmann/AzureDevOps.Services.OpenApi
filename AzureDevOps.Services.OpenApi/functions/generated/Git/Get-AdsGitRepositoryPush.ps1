function Get-AdsGitRepositoryPush {
<#
.SYNOPSIS
    Retrieves pushes associated with the specified repository.

.DESCRIPTION
    Retrieves pushes associated with the specified repository.

.PARAMETER IncludeCommits
    The number of commits to include in the result.

.PARAMETER PusherId
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER SearchIncludeRefUpdates
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER RefName
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER FromDate
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER Skip
    Number of pushes to skip.

.PARAMETER PushId
    ID of the push.

.PARAMETER ToDate
    Search criteria attributes: fromDate, toDate, pusherId, refName, includeRefUpdates or includeLinks. fromDate: Start date to search from. toDate: End date to search to. pusherId: Identity of the person who submitted the push. refName: Branch name to consider. includeRefUpdates: If true, include the list of refs that were updated by the push. includeLinks: Whether to include the _links field on the shallow references.

.PARAMETER IncludeRefUpdates
    If true, include the list of refs that were updated by the push.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER Project
    Project ID or project name

.PARAMETER Top
    Number of pushes to return.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER RepositoryId
    The name or ID of the repository.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPush -PushId $pushid -Organization $organization -Project $project -ApiVersion $apiversion -RepositoryId $repositoryid

    Retrieves a particular push.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryPush -Organization $organization -Project $project -ApiVersion $apiversion -RepositoryId $repositoryid

    Retrieves pushes associated with the specified repository.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [int32]
        $IncludeCommits,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PusherId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $SearchIncludeRefUpdates,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FromDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $PushId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ToDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [boolean]
        $IncludeRefUpdates,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pushes_Get')]
        [string]
        $RepositoryId
    )
    process {
        $__mapping = @{
            'IncludeCommits' = 'includeCommits'
            'PusherId' = 'searchCriteria.pusherId'
            'SearchIncludeRefUpdates' = 'searchCriteria.includeRefUpdates'
            'RefName' = 'searchCriteria.refName'
            'FromDate' = 'searchCriteria.fromDate'
            'Skip' = '$skip'
            'ToDate' = 'searchCriteria.toDate'
            'IncludeRefUpdates' = 'includeRefUpdates'
            'IncludeLinks' = 'searchCriteria.includeLinks'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeCommits','PusherId','SearchIncludeRefUpdates','RefName','FromDate','Skip','ToDate','IncludeRefUpdates','IncludeLinks','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pushes' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId
        if ($PushId) { $__path += "/$PushId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}