function Get-AdsGitRepositoryCommit {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve a list of commits associated with a particular push.

.PARAMETER IncludeLinks
    Set to false to avoid including REST Url links for resources. Defaults to true.

.PARAMETER CommitId
    The id of the commit.

.PARAMETER Project
    Project ID or project name

.PARAMETER Skip
    The number of commits to skip.

.PARAMETER ChangeCount
    The number of changes to include in the result.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Top
    The maximum number of commits to return ("get the top x commits").

.PARAMETER PushId
    The id of the push.

.PARAMETER RepositoryId
    The id or friendly name of the repository. To use the friendly name, projectId must also be specified.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryCommit -Project $project -ApiVersion $apiversion -PushId $pushid -RepositoryId $repositoryid -Organization $organization

    Retrieve a list of commits associated with a particular push.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryCommit -CommitId $commitid -Project $project -ApiVersion $apiversion -RepositoryId $repositoryid -Organization $organization

    Retrieve a particular commit.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $CommitId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [int32]
        $ChangeCount,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PushId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeLinks' = 'includeLinks'
            'Skip' = 'skip'
            'ChangeCount' = 'changeCount'
            'ApiVersion' = 'api-version'
            'Top' = 'top'
            'PushId' = 'pushId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeLinks','Skip','ChangeCount','ApiVersion','Top','PushId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/commits' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        if ($CommitId) { $__path += "/$CommitId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}