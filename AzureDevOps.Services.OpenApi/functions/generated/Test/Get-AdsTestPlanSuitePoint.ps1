function Get-AdsTestPlanSuitePoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test points.

.PARAMETER PointIds
    ID of the test point to get.

.PARAMETER TestPointIds
    Get test points for comma-separated list of test point IDs, valid only when configurationId and testCaseId are not set.

.PARAMETER WitFields
    Comma-separated list of work item field names.

.PARAMETER SuiteId
    ID of the suite that contains the points.

.PARAMETER IncludePointDetails
    Include all properties for the test point.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TestCaseId
    Get test points for a specific test case, valid when configurationId is not set.

.PARAMETER PlanId
    ID of the test plan.

.PARAMETER Project
    Project ID or project name

.PARAMETER Top
    Number of test points to return.

.PARAMETER ConfigurationId
    Get test points for specific configuration.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Skip
    Number of test points to skip..

.EXAMPLE
    PS C:\> Get-AdsTestPlanSuitePoint -PointIds $pointids -SuiteId $suiteid -Organization $organization -PlanId $planid -Project $project -ApiVersion $apiversion

    Get a test point.

.EXAMPLE
    PS C:\> Get-AdsTestPlanSuitePoint -SuiteId $suiteid -Organization $organization -PlanId $planid -Project $project -ApiVersion $apiversion

    Get a list of test points.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $PointIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestPointIds,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $WitFields,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $SuiteId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludePointDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestCaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ConfigurationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Points_Get Point')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip
    )
    process {
        $__mapping = @{
            'TestPointIds' = 'testPointIds'
            'WitFields' = 'witFields'
            'IncludePointDetails' = 'includePointDetails'
            'TestCaseId' = 'testCaseId'
            'Top' = '$top'
            'ConfigurationId' = 'configurationId'
            'ApiVersion' = 'api-version'
            'Skip' = '$skip'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('TestPointIds','WitFields','IncludePointDetails','TestCaseId','Top','ConfigurationId','ApiVersion','Skip') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Plans/{planId}/Suites/{suiteId}/points' -Replace '{suiteId}',$SuiteId -Replace '{organization}',$Organization -Replace '{planId}',$PlanId -Replace '{project}',$Project
        if ($PointIds) { $__path += "/$PointIds" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}