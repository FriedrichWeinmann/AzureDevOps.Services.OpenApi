function Get-AdsSourceproviderRepositorie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of source code repositories.

.PARAMETER Repository
    If specified, the vendor-specific identifier or the name of a single repository to get.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PageResults
    If set to true, this will limit the set of results and will return a continuation token to continue the query.

.PARAMETER ContinuationToken
    When paging results, this is a continuation token, returned by a previous call to this method, that can be used to return the next set of repositories.

.PARAMETER ResultSet
    'top' for the repositories most relevant for the endpoint. If not set, all repositories are returned. Ignored if 'repository' is set.

.PARAMETER ServiceEndpointId
    If specified, the ID of the service endpoint to query. Can only be omitted for providers that do not use service endpoints, e.g. TFVC or TFGit.

.PARAMETER Project
    Project ID or project name

.PARAMETER ProviderName
    The name of the source provider.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSourceproviderRepositorie -Organization $organization -Project $project -ProviderName $providername -ApiVersion $apiversion

    Gets a list of source code repositories.

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
        [boolean]
        $PageResults,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResultSet,

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
            'PageResults' = 'pageResults'
            'ContinuationToken' = 'continuationToken'
            'ResultSet' = 'resultSet'
            'ServiceEndpointId' = 'serviceEndpointId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Repository','PageResults','ContinuationToken','ResultSet','ServiceEndpointId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/sourceProviders/{providerName}/repositories' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{providerName}',$ProviderName

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}