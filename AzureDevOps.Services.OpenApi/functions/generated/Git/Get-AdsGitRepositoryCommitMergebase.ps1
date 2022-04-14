function Get-AdsGitRepositoryCommitMergebase {
<#
.SYNOPSIS
    

.DESCRIPTION
    Find the merge bases of two commits, optionally across forks. If otherRepositoryId is not specified, the merge bases will only be calculated within the context of the local repositoryNameOrId.

.PARAMETER CommitId
    First commit, usually the tip of the target branch of the potential merge.

.PARAMETER OtherCollectionId
    The collection ID where otherCommitId lives.

.PARAMETER RepositoryNameOrId
    ID or name of the local repository.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER OtherCommitId
    Other commit, usually the tip of the source branch of the potential merge.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER OtherRepositoryId
    The repository ID where otherCommitId lives.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryCommitMergebase -CommitId $commitid -RepositoryNameOrId $repositorynameorid -ApiVersion $apiversion -Project $project -OtherCommitId $othercommitid -Organization $organization

    Find the merge bases of two commits, optionally across forks. If otherRepositoryId is not specified, the merge bases will only be calculated within the context of the local repositoryNameOrId.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CommitId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OtherCollectionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryNameOrId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OtherCommitId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OtherRepositoryId
    )
    process {
        $__mapping = @{
            'OtherCollectionId' = 'otherCollectionId'
            'ApiVersion' = 'api-version'
            'OtherCommitId' = 'otherCommitId'
            'OtherRepositoryId' = 'otherRepositoryId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('OtherCollectionId','ApiVersion','OtherCommitId','OtherRepositoryId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryNameOrId}/commits/{commitId}/mergebases' -Replace '{commitId}',$CommitId -Replace '{repositoryNameOrId}',$RepositoryNameOrId -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}