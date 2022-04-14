function Get-AdsGitRepositoryForksyncrequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve all requested fork sync operations on this repository.

.PARAMETER IncludeAbandoned
    True to include abandoned requests.

.PARAMETER IncludeLinks
    True to include links.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ForkSyncOperationId
    OperationId of the sync request.

.PARAMETER RepositoryNameOrId
    The name or ID of the repository.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryForksyncrequest -ApiVersion $apiversion -ForkSyncOperationId $forksyncoperationid -RepositoryNameOrId $repositorynameorid -Project $project -Organization $organization

    Get a specific fork sync operation's details.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryForksyncrequest -ApiVersion $apiversion -RepositoryNameOrId $repositorynameorid -Project $project -Organization $organization

    Retrieve all requested fork sync operations on this repository.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeAbandoned,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Forks_Get fork sync request')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Forks_Get fork sync request')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Forks_Get fork sync request')]
        [string]
        $ForkSyncOperationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Forks_Get fork sync request')]
        [string]
        $RepositoryNameOrId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Forks_Get fork sync request')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Forks_Get fork sync request')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeAbandoned' = 'includeAbandoned'
            'IncludeLinks' = 'includeLinks'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeAbandoned','IncludeLinks','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryNameOrId}/forkSyncRequests' -Replace '{repositoryNameOrId}',$RepositoryNameOrId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($ForkSyncOperationId) { $__path += "/$ForkSyncOperationId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}