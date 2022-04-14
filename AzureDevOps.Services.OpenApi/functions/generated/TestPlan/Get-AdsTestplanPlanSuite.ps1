function Get-AdsTestplanPlanSuite {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get test suites for plan.

.PARAMETER SuiteId
    ID of the suite to get.

.PARAMETER ContinuationToken
    If the list of suites returned is not complete, a continuation token to query next batch of suites is included in the response header as "x-ms-continuationtoken". Omit this parameter to get the first batch of test suites.

.PARAMETER Expand
    Include the children suites and testers details.

.PARAMETER PlanId
    ID of the test plan for which suites are requested.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER AsTreeView
    If the suites returned should be in a tree structure.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuite -PlanId $planid -ApiVersion $apiversion -Project $project -Organization $organization

    Get test suites for plan.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuite -SuiteId $suiteid -PlanId $planid -ApiVersion $apiversion -Project $project -Organization $organization

    Get test suite by suite id.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Suites_Get')]
        [string]
        $SuiteId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Suites_Get')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Suites_Get')]
        [string]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Suites_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $AsTreeView,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Suites_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Suites_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Expand' = 'expand'
            'ApiVersion' = 'api-version'
            'AsTreeView' = 'asTreeView'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Expand','ApiVersion','AsTreeView') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/suites' -Replace '{planId}',$PlanId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($SuiteId) { $__path += "/$SuiteId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}