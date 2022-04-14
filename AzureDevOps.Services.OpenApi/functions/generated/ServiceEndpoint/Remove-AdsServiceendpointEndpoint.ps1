function Remove-AdsServiceendpointEndpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a service endpoint

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER Deep
    delete the spn created by endpoint

.PARAMETER ProjectIds
    project Ids from which endpoint needs to be deleted

.PARAMETER EndpointId
    Endpoint Id of endpoint to delete

.EXAMPLE
    PS C:\> Remove-AdsServiceendpointEndpoint -Organization $organization -ApiVersion $apiversion -ProjectIds $projectids -EndpointId $endpointid

    Delete a service endpoint

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Deep,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProjectIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndpointId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Deep' = 'deep'
            'ProjectIds' = 'projectIds'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Deep','ProjectIds') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/serviceendpoint/endpoints/{endpointId}' -Replace '{organization}',$Organization -Replace '{endpointId}',$EndpointId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}