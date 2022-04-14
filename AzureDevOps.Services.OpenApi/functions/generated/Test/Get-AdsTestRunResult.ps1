function Get-AdsTestRunResult {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get test results for a test run.

.PARAMETER Skip
    Number of test results to skip from beginning.

.PARAMETER TestCaseResultId
    Test result ID.

.PARAMETER DetailsToInclude
    Details to include with test results. Default is None. Other values are Iterations and WorkItems.

.PARAMETER Top
    Number of test results to return. Maximum is 1000 when detailsToInclude is None and 200 otherwise.

.PARAMETER RunId
    Test run ID of test results to fetch.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Outcomes
    Comma separated list of test outcomes to filter test results.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.6' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsTestRunResult -TestCaseResultId $testcaseresultid -RunId $runid -Project $project -Organization $organization -ApiVersion $apiversion

    Get a test result for a test run.

.EXAMPLE
    PS C:\> Get-AdsTestRunResult -RunId $runid -Project $project -Organization $organization -ApiVersion $apiversion

    Get test results for a test run.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $TestCaseResultId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $DetailsToInclude,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

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
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Outcomes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Results_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'DetailsToInclude' = 'detailsToInclude'
            'Top' = '$top'
            'Outcomes' = 'outcomes'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','DetailsToInclude','Top','Outcomes','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Runs/{runId}/results' -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($TestCaseResultId) { $__path += "/$TestCaseResultId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}