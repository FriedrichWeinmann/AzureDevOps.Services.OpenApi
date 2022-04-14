function Get-AdsCltTestdefinition {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER ToDate
    Date before which test definitions were crated

.PARAMETER TestDefinitionId
    The test definition identifier

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.PARAMETER Top
    

.PARAMETER FromDate
    Date after which test definitions were created

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsCltTestdefinition -ApiVersion $apiversion -Organization $organization

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsCltTestdefinition -TestDefinitionId $testdefinitionid -ApiVersion $apiversion -Organization $organization

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ToDate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Definitions_Get')]
        [string]
        $TestDefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Definitions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FromDate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Definitions_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ToDate' = 'toDate'
            'ApiVersion' = 'api-version'
            'Top' = 'top'
            'FromDate' = 'fromDate'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ToDate','ApiVersion','Top','FromDate') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/testdefinitions' -Replace '{organization}',$Organization
        if ($TestDefinitionId) { $__path += "/$TestDefinitionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}