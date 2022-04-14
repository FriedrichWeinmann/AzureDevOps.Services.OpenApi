function Get-AdsGitPolicyConfiguration {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve a list of policy configurations by a given set of scope/filtering criteria.

Below is a short description of how all of the query parameters interact with each other:
- repositoryId set, refName set: returns all policy configurations that *apply* to a particular branch in a repository
- repositoryId set, refName unset: returns all policy configurations that *apply* to a particular repository
- repositoryId unset, refName unset: returns all policy configurations that are *defined* at the project level
- repositoryId unset, refName set: returns all project-level branch policies, plus the project level configurations
For all of the examples above, when policyType is set, it'll restrict results to the given policy type

.PARAMETER ContinuationToken
    Pass a policy configuration ID to fetch the next page of results, up to top number of results, for this endpoint.

.PARAMETER PolicyType
    The policy type filter.

.PARAMETER Top
    Maximum number of policies to return.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The repository id.

.PARAMETER RefName
    The fully-qualified Git ref name (e.g. refs/heads/master).

.EXAMPLE
    PS C:\> Get-AdsGitPolicyConfiguration -Project $project -ApiVersion $apiversion -Organization $organization

    Retrieve a list of policy configurations by a given set of scope/filtering criteria.

Below is a short description of how all of the query parameters interact with each other:
- repositoryId set, refName set: returns all policy configurations that *apply* to a particular branch in a repository
- repositoryId set, refName unset: returns all policy configurations that *apply* to a particular repository
- repositoryId unset, refName unset: returns all policy configurations that are *defined* at the project level
- repositoryId unset, refName set: returns all project-level branch policies, plus the project level configurations
For all of the examples above, when policyType is set, it'll restrict results to the given policy type

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PolicyType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RefName
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'PolicyType' = 'policyType'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
            'RepositoryId' = 'repositoryId'
            'RefName' = 'refName'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','PolicyType','Top','ApiVersion','RepositoryId','RefName') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/policy/configurations' -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}