function Get-AdsGitRepositoryRevert {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve information about a revert operation for a specific branch.

.PARAMETER RevertId
    ID of the revert operation.

.PARAMETER RefName
    The GitAsyncRefOperationParameters generatedRefName used for the revert operation.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER RepositoryId
    ID of the repository.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryRevert -RefName $refname -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Retrieve information about a revert operation for a specific branch.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryRevert -RevertId $revertid -ApiVersion $apiversion -Project $project -RepositoryId $repositoryid -Organization $organization

    Retrieve information about a revert operation by revert Id.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Reverts_Get Revert')]
        [string]
        $RevertId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Reverts_Get Revert')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Reverts_Get Revert')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Reverts_Get Revert')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Reverts_Get Revert')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'RefName' = 'refName'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('RefName','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/reverts' -Replace '{project}',$Project -Replace '{repositoryId}',$RepositoryId -Replace '{organization}',$Organization
        if ($RevertId) { $__path += "/$RevertId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}