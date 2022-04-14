function Remove-AdsTestplanPlanSuiteTestcase {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes test cases from a suite based on the list of test case Ids provided. This API can be used to remove a larger number of test cases.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TestIds
    Comma separated string of Test Case Ids to be removed.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER PlanId
    ID of the test plan from which test cases are to be removed.

.PARAMETER SuiteId
    ID of the test suite from which test cases are to be removed.

.EXAMPLE
    PS C:\> Remove-AdsTestplanPlanSuiteTestcase -Organization $organization -TestIds $testids -Project $project -ApiVersion $apiversion -PlanId $planid -SuiteId $suiteid

    Removes test cases from a suite based on the list of test case Ids provided. This API can be used to remove a larger number of test cases.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SuiteId
    )
    process {
        $__mapping = @{
            'TestIds' = 'testIds'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('TestIds','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/Suites/{suiteId}/TestCase' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{planId}',$PlanId -Replace '{suiteId}',$SuiteId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}