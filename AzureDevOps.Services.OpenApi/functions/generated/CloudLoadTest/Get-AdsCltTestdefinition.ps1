function Get-AdsCltTestdefinition {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER TestDefinitionId
    The test definition identifier

.PARAMETER FromDate
    Date after which test definitions were created

.PARAMETER ToDate
    Date before which test definitions were crated

.PARAMETER Top
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsCltTestdefinition -TestDefinitionId $testdefinitionid -Organization $organization -ApiVersion $apiversion

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsCltTestdefinition -Organization $organization -ApiVersion $apiversion

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Definitions_Get')]
        [string]
        $TestDefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FromDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ToDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Definitions_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Definitions_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'FromDate' = 'fromDate'
            'ToDate' = 'toDate'
            'Top' = 'top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('FromDate','ToDate','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/testdefinitions' -Replace '{organization}',$Organization
        if ($TestDefinitionId) { $__path += "/$TestDefinitionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}