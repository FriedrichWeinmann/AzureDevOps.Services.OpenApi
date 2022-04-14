function Get-AdsTestRunResult {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get test results for a test run.

.PARAMETER Outcomes
    Comma separated list of test outcomes to filter test results.

.PARAMETER DetailsToInclude
    Details to include with test results. Default is None. Other values are Iterations and WorkItems.

.PARAMETER Skip
    Number of test results to skip from beginning.

.PARAMETER Top
    Number of test results to return. Maximum is 1000 when detailsToInclude is None and 200 otherwise.

.PARAMETER TestCaseResultId
    Test result ID.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.6' to use this version of the api.

.PARAMETER RunId
    Test run ID of test results to fetch.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestRunResult -ApiVersion $apiversion -RunId $runid -Project $project -Organization $organization

    Get test results for a test run.

.EXAMPLE
    PS C:\> Get-AdsTestRunResult -TestCaseResultId $testcaseresultid -ApiVersion $apiversion -RunId $runid -Project $project -Organization $organization

    Get a test result for a test run.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Outcomes,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $DetailsToInclude,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $TestCaseResultId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Outcomes' = 'outcomes'
            'DetailsToInclude' = 'detailsToInclude'
            'Skip' = '$skip'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Outcomes','DetailsToInclude','Skip','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Runs/{runId}/results' -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($TestCaseResultId) { $__path += "/$TestCaseResultId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}