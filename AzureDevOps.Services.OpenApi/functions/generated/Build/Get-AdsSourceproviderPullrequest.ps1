function Get-AdsSourceproviderPullrequest {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a pull request object from source provider.

.PARAMETER PullRequestId
    Vendor-specific id of the pull request.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ServiceEndpointId
    If specified, the ID of the service endpoint to query. Can only be omitted for providers that do not use service endpoints, e.g. TFVC or TFGit.

.PARAMETER Project
    Project ID or project name

.PARAMETER ProviderName
    The name of the source provider.

.PARAMETER RepositoryId
    Vendor-specific identifier or the name of the repository that contains the pull request.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSourceproviderPullrequest -PullRequestId $pullrequestid -Organization $organization -Project $project -ProviderName $providername -ApiVersion $apiversion

    Gets a pull request object from source provider.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PullRequestId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ServiceEndpointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProviderName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RepositoryId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ServiceEndpointId' = 'serviceEndpointId'
            'RepositoryId' = 'repositoryId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ServiceEndpointId','RepositoryId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/sourceProviders/{providerName}/pullrequests/{pullRequestId}' -Replace '{pullRequestId}',$PullRequestId -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{providerName}',$ProviderName

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}