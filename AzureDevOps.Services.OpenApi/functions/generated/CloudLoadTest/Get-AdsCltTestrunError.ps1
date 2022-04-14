function Get-AdsCltTestrunError {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER Detailed
    To include the details of test errors such as messagetext, request, stacktrace, testcasename, scenarioname, and lasterrordate.

.PARAMETER TestRunId
    The test run identifier

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.2' to use this version of the api.

.PARAMETER Type
    Filter for the particular type of errors.

.PARAMETER SubType
    Filter for a particular subtype of errors. You should not provide error subtype without error type.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsCltTestrunError -TestRunId $testrunid -ApiVersion $apiversion -Organization $organization

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Detailed,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestRunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SubType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Detailed' = 'detailed'
            'ApiVersion' = 'api-version'
            'Type' = 'type'
            'SubType' = 'subType'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Detailed','ApiVersion','Type','SubType') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/testRuns/{testRunId}/errors' -Replace '{testRunId}',$TestRunId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}