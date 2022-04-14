function Get-AdsUserentitlementsummary {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get summary of Licenses, Extension, Projects, Groups and their assignments in the collection.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Select
    Comma (",") separated list of properties to select. Supported property names are {AccessLevels, Licenses, Projects, Groups}.

.EXAMPLE
    PS C:\> Get-AdsUserentitlementsummary -ApiVersion $apiversion -Organization $organization

    Get summary of Licenses, Extension, Projects, Groups and their assignments in the collection.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Select
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Select' = 'select'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Select') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/userentitlementsummary' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}