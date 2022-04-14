function Get-AdsSourceproviderFilecontent {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the contents of a file in the given source code repository.

.PARAMETER Repository
    If specified, the vendor-specific identifier or the name of the repository to get branches. Can only be omitted for providers that do not support multiple repositories.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Path
    The path to the file to retrieve, relative to the root of the repository.

.PARAMETER ServiceEndpointId
    If specified, the ID of the service endpoint to query. Can only be omitted for providers that do not use service endpoints, e.g. TFVC or TFGit.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ProviderName
    The name of the source provider.

.PARAMETER CommitOrBranch
    The identifier of the commit or branch from which a file's contents are retrieved.

.EXAMPLE
    PS C:\> Get-AdsSourceproviderFilecontent -Organization $organization -Project $project -ApiVersion $apiversion -ProviderName $providername

    Gets the contents of a file in the given source code repository.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Repository,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Path,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ServiceEndpointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProviderName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CommitOrBranch
    )
    process {
        $__mapping = @{
            'Repository' = 'repository'
            'Path' = 'path'
            'ServiceEndpointId' = 'serviceEndpointId'
            'ApiVersion' = 'api-version'
            'CommitOrBranch' = 'commitOrBranch'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Repository','Path','ServiceEndpointId','ApiVersion','CommitOrBranch') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/sourceProviders/{providerName}/filecontents' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{providerName}',$ProviderName

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}