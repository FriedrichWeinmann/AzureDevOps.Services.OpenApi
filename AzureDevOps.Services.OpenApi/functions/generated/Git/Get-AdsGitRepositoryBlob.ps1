function Get-AdsGitRepositoryBlob {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a single blob.

Repositories have both a name and an identifier. Identifiers are globally unique,
but several projects may contain a repository of the same name. You don't need to include
the project if you specify a repository by ID. However, if you specify a repository by name,
you must also specify the project (by name or ID).

.PARAMETER ResolveLfs
    If true, try to resolve a blob to its LFS contents, if it's an LFS pointer file. Only compatible with octet-stream Accept headers or $format types

.PARAMETER Sha1
    SHA1 hash of the file. You can get the SHA1 of a file using the "Git/Items/Get Item" endpoint.

.PARAMETER FileName
    Provide a fileName to use for a download.

.PARAMETER Download
    If true, prompt for a download rather than rendering in a browser. Note: this value defaults to true if $format is zip

.PARAMETER Format
    Options: json, zip, text, octetstream. If not set, defaults to the MIME type set in the Accept header.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RepositoryId
    The name or ID of the repository.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGitRepositoryBlob -Sha1 $sha1 -Project $project -Organization $organization -RepositoryId $repositoryid -ApiVersion $apiversion

    Get a single blob.

Repositories have both a name and an identifier. Identifiers are globally unique,
but several projects may contain a repository of the same name. You don't need to include
the project if you specify a repository by ID. However, if you specify a repository by name,
you must also specify the project (by name or ID).

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ResolveLfs,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Sha1,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FileName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Download,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Format,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

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
            'ResolveLfs' = 'resolveLfs'
            'FileName' = 'fileName'
            'Download' = 'download'
            'Format' = '$format'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ResolveLfs','FileName','Download','Format','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/blobs/{sha1}' -Replace '{sha1}',$Sha1 -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{repositoryId}',$RepositoryId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}