function Get-AdsTestplanPlanSuiteTestcase {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get Test Case List return those test cases which have all the configuration Ids as mentioned in the optional parameter. If configuration Ids is null, it return all the test cases

.PARAMETER TestCaseId
    Test Case Id to be fetched.

.PARAMETER PlanId
    ID of the test plan for which test cases are requested.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER ConfigurationIds
    Fetch Test Cases which contains all the configuration Ids specified.

.PARAMETER IsRecursive
    

.PARAMETER ReturnIdentityRef
    If set to true, returns all identity fields, like AssignedTo, ActivatedBy etc., as IdentityRef objects. If set to false, these fields are returned as unique names in string format. This is false by default.

.PARAMETER Expand
    If set to false, will get a smaller payload containing only basic details about the suite test case object

.PARAMETER Project
    Project ID or project name

.PARAMETER TestIds
    Test Case Ids to be fetched.

.PARAMETER WitFields
    Get the list of witFields.

.PARAMETER SuiteId
    ID of the test suite for which test cases are requested.

.PARAMETER ContinuationToken
    If the list of test cases returned is not complete, a continuation token to query next batch of test cases is included in the response header as "x-ms-continuationtoken". Omit this parameter to get the first batch of test cases.

.PARAMETER ExcludeFlags
    Flag to exclude various values from payload. For example to remove point assignments pass exclude = 1. To remove extra information (links, test plan , test suite) pass exclude = 2. To remove both extra information and point assignments pass exclude = 3 (1 + 2).

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuiteTestcase -PlanId $planid -ApiVersion $apiversion -Project $project -SuiteId $suiteid -Organization $organization

    Get Test Case List return those test cases which have all the configuration Ids as mentioned in the optional parameter. If configuration Ids is null, it return all the test cases

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuiteTestcase -TestCaseId $testcaseid -PlanId $planid -ApiVersion $apiversion -Project $project -SuiteId $suiteid -Organization $organization

    Get a particular Test Case from a Suite.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
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
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConfigurationIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsRecursive,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [boolean]
        $ReturnIdentityRef,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestIds,

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
        $ExcludeFlags,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Suite Test Case_Get Test Case')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'ConfigurationIds' = 'configurationIds'
            'IsRecursive' = 'isRecursive'
            'ReturnIdentityRef' = 'returnIdentityRef'
            'Expand' = 'expand'
            'TestIds' = 'testIds'
            'WitFields' = 'witFields'
            'ContinuationToken' = 'continuationToken'
            'ExcludeFlags' = 'excludeFlags'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','ConfigurationIds','IsRecursive','ReturnIdentityRef','Expand','TestIds','WitFields','ContinuationToken','ExcludeFlags') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/Suites/{suiteId}/TestCase' -Replace '{planId}',$PlanId -Replace '{project}',$Project -Replace '{suiteId}',$SuiteId -Replace '{organization}',$Organization
        if ($TestCaseId) { $__path += "/$TestCaseId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}