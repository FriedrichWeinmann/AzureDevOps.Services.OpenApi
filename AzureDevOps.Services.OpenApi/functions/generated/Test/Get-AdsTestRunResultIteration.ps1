function Get-AdsTestRunResultIteration {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get iterations for a result

.PARAMETER IncludeActionResults
    Include result details for each action performed in the test iteration. ActionResults refer to outcome (pass/fail) of test steps that are executed as part of a running a manual test. Including the ActionResults flag gets the outcome of test steps in the actionResults section and test parameters in the parameters section for each test iteration.

.PARAMETER TestCaseResultId
    ID of the test result that contains the iterations.

.PARAMETER IterationId
    Id of the test results Iteration.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER RunId
    ID of the test run that contains the result.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestRunResultIteration -TestCaseResultId $testcaseresultid -ApiVersion $apiversion -RunId $runid -Project $project -Organization $organization

    Get iterations for a result

.EXAMPLE
    PS C:\> Get-AdsTestRunResultIteration -TestCaseResultId $testcaseresultid -IterationId $iterationid -ApiVersion $apiversion -RunId $runid -Project $project -Organization $organization

    Get iteration for a result

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [boolean]
        $IncludeActionResults,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [string]
        $TestCaseResultId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [string]
        $IterationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Iterations_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeActionResults' = 'includeActionResults'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeActionResults','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Runs/{runId}/Results/{testCaseResultId}/iterations' -Replace '{testCaseResultId}',$TestCaseResultId -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($IterationId) { $__path += "/$IterationId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}