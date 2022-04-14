function Get-AdsSourceproviderBranche {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of branches for the given source code repository.

.PARAMETER Repository
    The vendor-specific identifier or the name of the repository to get branches. Can only be omitted for providers that do not support multiple repositories.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER BranchName
    If supplied, the name of the branch to check for specifically.

.PARAMETER ServiceEndpointId
    If specified, the ID of the service endpoint to query. Can only be omitted for providers that do not use service endpoints, e.g. TFVC or TFGit.

.PARAMETER Project
    Project ID or project name

.PARAMETER ProviderName
    The name of the source provider.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSourceproviderBranche -Organization $organization -Project $project -ProviderName $providername -ApiVersion $apiversion

    Gets a list of branches for the given source code repository.

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
        $BranchName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ServiceEndpointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProviderName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Repository' = 'repository'
            'BranchName' = 'branchName'
            'ServiceEndpointId' = 'serviceEndpointId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Repository','BranchName','ServiceEndpointId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/sourceProviders/{providerName}/branches' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{providerName}',$ProviderName

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}