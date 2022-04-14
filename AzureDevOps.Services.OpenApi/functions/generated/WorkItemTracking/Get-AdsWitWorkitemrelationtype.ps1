function Get-AdsWitWorkitemrelationtype {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the work item relation types.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Relation
    The relation name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemrelationtype -Organization $organization -Relation $relation -ApiVersion $apiversion

    Gets the work item relation type definition.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitemrelationtype -Organization $organization -ApiVersion $apiversion

    Gets the work item relation types.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Relation Types_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Relation Types_Get')]
        [string]
        $Relation,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Item Relation Types_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/wit/workitemrelationtypes' -Replace '{organization}',$Organization
        if ($Relation) { $__path += "/$Relation" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}