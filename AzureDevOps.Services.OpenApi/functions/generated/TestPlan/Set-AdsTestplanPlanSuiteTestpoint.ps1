function Set-AdsTestplanPlanSuiteTestpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update Test Points. This is used to Reset test point to active, update the outcome of a test point or update the tester of a test point

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ReturnIdentityRef
    If set to true, returns the AssignedTo field in TestCaseReference as IdentityRef object.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER PlanId
    ID of the test plan for which test points are requested.

.PARAMETER IncludePointDetails
    If set to false, will get a smaller payload containing only basic details about the test point object

.PARAMETER SuiteId
    ID of the test suite for which test points are requested.

.EXAMPLE
    PS C:\> Set-AdsTestplanPlanSuiteTestpoint -Organization $organization -Project $project -ApiVersion $apiversion -PlanId $planid -SuiteId $suiteid

    Update Test Points. This is used to Reset test point to active, update the outcome of a test point or update the tester of a test point

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ReturnIdentityRef,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PlanId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludePointDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SuiteId
    )
    process {
        $__mapping = @{
            'ReturnIdentityRef' = 'returnIdentityRef'
            'ApiVersion' = 'api-version'
            'IncludePointDetails' = 'includePointDetails'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ReturnIdentityRef','ApiVersion','IncludePointDetails') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/Suites/{suiteId}/TestPoint' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{planId}',$PlanId -Replace '{suiteId}',$SuiteId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}