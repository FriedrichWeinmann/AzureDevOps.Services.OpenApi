function Get-AdsGitRepositoryCommit {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve a list of commits associated with a particular push.

.PARAMETER ChangeCount
    The number of changes to include in the result.

.PARAMETER Skip
    The number of commits to skip.

.PARAMETER IncludeLinks
    Set to false to avoid including REST Url links for resources. Defaults to true.

.PARAMETER CommitId
    The id of the commit.

.PARAMETER Top
    The maximum number of commits to return ("get the top x commits").

.PARAMETER Project
    Project ID or project name

.PARAMETER PushId
    The id of the push.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The id or friendly name of the repository. To use the friendly name, projectId must also be specified.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryCommit -CommitId $commitid -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Retrieve a particular commit.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryCommit -Project $project -PushId $pushid -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Retrieve a list of commits associated with a particular push.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [int32]
        $ChangeCount,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $CommitId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PushId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Commits_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ChangeCount' = 'changeCount'
            'Skip' = 'skip'
            'IncludeLinks' = 'includeLinks'
            'Top' = 'top'
            'PushId' = 'pushId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ChangeCount','Skip','IncludeLinks','Top','PushId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/commits' -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId
        if ($CommitId) { $__path += "/$CommitId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}