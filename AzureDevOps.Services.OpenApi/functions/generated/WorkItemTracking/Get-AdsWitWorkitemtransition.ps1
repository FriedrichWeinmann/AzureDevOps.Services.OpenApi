function Get-AdsWitWorkitemtransition {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns the next state on the given work item IDs.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Ids
    list of work item ids

.PARAMETER Action
    possible actions. Currently only supports checkin

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemtransition -Organization $organization -ApiVersion $apiversion -Ids $ids

    Returns the next state on the given work item IDs.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Ids,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Action
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Ids' = 'ids'
            'Action' = 'action'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Ids','Action') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/wit/workitemtransitions' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}