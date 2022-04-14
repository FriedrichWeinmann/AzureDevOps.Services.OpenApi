function Get-AdsTestplanPlanSuiteTestcase {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get Test Case List return those test cases which have all the configuration Ids as mentioned in the optional parameter. If configuration Ids is null, it return all the test cases

.PARAMETER Expand
    If set to false, will get a smaller payload containing only basic details about the suite test case object

.PARAMETER ReturnIdentityRef
    If set to true, returns all identity fields, like AssignedTo, ActivatedBy etc., as IdentityRef objects. If set to false, these fields are returned as unique names in string format. This is false by default.

.PARAMETER WitFields
    Get the list of witFields.

.PARAMETER SuiteId
    ID of the test suite for which test cases are requested.

.PARAMETER ContinuationToken
    If the list of test cases returned is not complete, a continuation token to query next batch of test cases is included in the response header as "x-ms-continuationtoken". Omit this parameter to get the first batch of test cases.

.PARAMETER ConfigurationIds
    Fetch Test Cases which contains all the configuration Ids specified.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TestCaseId
    Test Case Id to be fetched.

.PARAMETER PlanId
    ID of the test plan for which test cases are requested.

.PARAMETER Project
    Project ID or project name

.PARAMETER IsRecursive
    

.PARAMETER ExcludeFlags
    Flag to exclude various values from payload. For example to remove point assignments pass exclude = 1. To remove extra information (links, test plan , test suite) pass exclude = 2. To remove both extra information and point assignments pass exclude = 3 (1 + 2).

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER TestIds
    Test Case Ids to be fetched.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuiteTestcase -SuiteId $suiteid -Organization $organization -TestCaseId $testcaseid -PlanId $planid -Project $project -ApiVersion $apiversion

    Get a particular Test Case from a Suite.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuiteTestcase -SuiteId $suiteid -Organization $organization -PlanId $planid -Project $project -ApiVersion $apiversion

    Get Test Case List return those test cases which have all the configuration Ids as mentioned in the optional parameter. If configuration Ids is null, it return all the test cases

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [boolean]
        $ReturnIdentityRef,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $WitFields,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $SuiteId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConfigurationIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $TestCaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsRecursive,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ExcludeFlags,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestIds
    )
    process {
        $__mapping = @{
            'Expand' = 'expand'
            'ReturnIdentityRef' = 'returnIdentityRef'
            'WitFields' = 'witFields'
            'ContinuationToken' = 'continuationToken'
            'ConfigurationIds' = 'configurationIds'
            'IsRecursive' = 'isRecursive'
            'ExcludeFlags' = 'excludeFlags'
            'ApiVersion' = 'api-version'
            'TestIds' = 'testIds'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expand','ReturnIdentityRef','WitFields','ContinuationToken','ConfigurationIds','IsRecursive','ExcludeFlags','ApiVersion','TestIds') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/Suites/{suiteId}/TestCase' -Replace '{suiteId}',$SuiteId -Replace '{organization}',$Organization -Replace '{planId}',$PlanId -Replace '{project}',$Project
        if ($TestCaseId) { $__path += "/$TestCaseId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}