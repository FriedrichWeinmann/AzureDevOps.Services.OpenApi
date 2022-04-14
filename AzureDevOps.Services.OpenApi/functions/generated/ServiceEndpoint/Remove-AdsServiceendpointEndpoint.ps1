function Remove-AdsServiceendpointEndpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a service endpoint

.PARAMETER ProjectIds
    project Ids from which endpoint needs to be deleted

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER EndpointId
    Endpoint Id of endpoint to delete

.PARAMETER Deep
    delete the spn created by endpoint

.EXAMPLE
    PS C:\> Remove-AdsServiceendpointEndpoint -ProjectIds $projectids -ApiVersion $apiversion -Organization $organization -EndpointId $endpointid

    Delete a service endpoint

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProjectIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EndpointId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Deep
    )
    process {
        $__mapping = @{
            'ProjectIds' = 'projectIds'
            'ApiVersion' = 'api-version'
            'Deep' = 'deep'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ProjectIds','ApiVersion','Deep') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/serviceendpoint/endpoints/{endpointId}' -Replace '{organization}',$Organization -Replace '{endpointId}',$EndpointId
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}