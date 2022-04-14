function Set-AdsTestplanPlanSuiteTestcase {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update the configurations for test cases

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER PlanId
    ID of the test plan to which test cases are to be updated.

.PARAMETER Project
    Project ID or project name

.PARAMETER SuiteId
    ID of the test suite to which test cases are to be updated.

.EXAMPLE
    PS C:\> Set-AdsTestplanPlanSuiteTestcase -Organization $organization -ApiVersion $apiversion -PlanId $planid -Project $project -SuiteId $suiteid

    Update the configurations for test cases

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SuiteId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/Plans/{planId}/Suites/{suiteId}/TestCase' -Replace '{organization}',$Organization -Replace '{planId}',$PlanId -Replace '{project}',$Project -Replace '{suiteId}',$SuiteId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}