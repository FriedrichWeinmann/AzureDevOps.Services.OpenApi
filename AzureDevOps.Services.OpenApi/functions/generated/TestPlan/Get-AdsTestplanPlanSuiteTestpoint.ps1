function Get-AdsTestplanPlanSuiteTestpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a particular Test Point from a suite.

.PARAMETER SuiteId
    ID of the test suite for which test points are requested.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER PointId
    ID of test point to be fetched.

.PARAMETER PlanId
    ID of the test plan for which test points are requested.

.PARAMETER IncludePointDetails
    If set to false, will get a smaller payload containing only basic details about the test point object

.PARAMETER ReturnIdentityRef
    If set to true, returns the AssignedTo field in TestCaseReference as IdentityRef object.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlanSuiteTestpoint -SuiteId $suiteid -ApiVersion $apiversion -PointId $pointid -PlanId $planid -Project $project -Organization $organization

    Get a particular Test Point from a suite.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SuiteId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PointId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PlanId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludePointDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ReturnIdentityRef,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'PointId' = 'pointId'
            'IncludePointDetails' = 'includePointDetails'
            'ReturnIdentityRef' = 'returnIdentityRef'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','PointId','IncludePointDetails','ReturnIdentityRef') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/Suites/{suiteId}/TestPoint' -Replace '{suiteId}',$SuiteId -Replace '{planId}',$PlanId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}