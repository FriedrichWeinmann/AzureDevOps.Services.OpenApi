function Get-AdsGitRepositoryDiffCommit {
<#
.SYNOPSIS
    

.DESCRIPTION
    Find the closest common commit (the merge base) between base and target commits, and get the diff between either the base and target commits or common and target commits.

.PARAMETER TargetVersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER TargetVersion
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER TargetVersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER Top
    Maximum number of changes to return. Defaults to 100.

.PARAMETER BaseVersion
    Version string identifier (name of tag/branch, SHA1 of commit)

.PARAMETER Skip
    Number of changes to skip

.PARAMETER BaseVersionType
    Version type (branch, tag, or commit). Determines how Id is interpreted

.PARAMETER BaseVersionOptions
    Version options - Specify additional modifiers to version (e.g Previous)

.PARAMETER Project
    Project ID or project name

.PARAMETER DiffCommonCommit
    If true, diff between common and target commits. If false, diff between base and target commits.

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryDiffCommit -Project $project -RepositoryId $repositoryid -ApiVersion $apiversion -Organization $organization

    Find the closest common commit (the merge base) between base and target commits, and get the diff between either the base and target commits or common and target commits.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetVersionOptions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TargetVersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BaseVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BaseVersionType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BaseVersionOptions,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $DiffCommonCommit,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'TargetVersionOptions' = 'targetVersionOptions'
            'TargetVersion' = 'targetVersion'
            'TargetVersionType' = 'targetVersionType'
            'Top' = '$top'
            'BaseVersion' = 'baseVersion'
            'Skip' = '$skip'
            'BaseVersionType' = 'baseVersionType'
            'BaseVersionOptions' = 'baseVersionOptions'
            'DiffCommonCommit' = 'diffCommonCommit'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('TargetVersionOptions','TargetVersion','TargetVersionType','Top','BaseVersion','Skip','BaseVersionType','BaseVersionOptions','DiffCommonCommit','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/diffs/commits' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}