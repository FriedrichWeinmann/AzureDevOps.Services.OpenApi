function Get-AdsServiceendpointExecutionhistory {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get service endpoint execution records.

.PARAMETER ContinuationToken
    A continuation token, returned by a previous call to this method, that can be used to return the next set of records

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Top
    Number of service endpoint execution records to get.

.PARAMETER Project
    Project ID or project name

.PARAMETER EndpointId
    Id of the service endpoint.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsServiceendpointExecutionhistory -Organization $organization -Project $project -EndpointId $endpointid -ApiVersion $apiversion

    Get service endpoint execution records.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndpointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Top' = 'top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/serviceendpoint/{endpointId}/executionhistory' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{endpointId}',$EndpointId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}