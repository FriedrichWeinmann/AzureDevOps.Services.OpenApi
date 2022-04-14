function Get-AdsGitRepositoryTree {
<#
.SYNOPSIS
    

.DESCRIPTION
    The Tree endpoint returns the collection of objects underneath the specified tree. Trees are folders in a Git repository.

Repositories have both a name and an identifier. Identifiers are globally unique, but several projects may contain a repository of the same name. You don't need to include the project if you specify a repository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID.

.PARAMETER Sha1
    SHA1 hash of the tree object.

.PARAMETER FileName
    Name to use if a .zip file is returned. Default is the object ID.

.PARAMETER ProjectId
    Project Id.

.PARAMETER Format
    Use "zip". Defaults to the MIME type set in the Accept header.

.PARAMETER Project
    Project ID or project name

.PARAMETER Recursive
    Search recursively. Include trees underneath this tree. Default is false.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    Repository Id.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryTree -Sha1 $sha1 -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    The Tree endpoint returns the collection of objects underneath the specified tree. Trees are folders in a Git repository.

Repositories have both a name and an identifier. Identifiers are globally unique, but several projects may contain a repository of the same name. You don't need to include the project if you specify a repository by ID. However, if you specify a repository by name, you must also specify the project (by name or ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Sha1,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FileName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProjectId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Format,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Recursive,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'FileName' = 'fileName'
            'ProjectId' = 'projectId'
            'Format' = '$format'
            'Recursive' = 'recursive'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('FileName','ProjectId','Format','Recursive','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/trees/{sha1}' -Replace '{sha1}',$Sha1 -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}