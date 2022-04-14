function Get-AdsTestplanPlan {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test plans

.PARAMETER IncludePlanDetails
    Get all properties of the test plan

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FilterActivePlans
    Get just the active plans

.PARAMETER ContinuationToken
    If the list of plans returned is not complete, a continuation token to query next batch of plans is included in the response header as "x-ms-continuationtoken". Omit this parameter to get the first batch of test plans.

.PARAMETER Project
    Project ID or project name

.PARAMETER Owner
    Filter for test plan by owner ID or name

.PARAMETER PlanId
    ID of the test plan to get.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlan -Organization $organization -Project $project -PlanId $planid -ApiVersion $apiversion

    Get a test plan by Id.

.EXAMPLE
    PS C:\> Get-AdsTestplanPlan -Organization $organization -Project $project -ApiVersion $apiversion

    Get a list of test plans

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludePlanDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Plans_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $FilterActivePlans,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Plans_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Plans_Get')]
        [string]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test  Plans_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'IncludePlanDetails' = 'includePlanDetails'
            'FilterActivePlans' = 'filterActivePlans'
            'ContinuationToken' = 'continuationToken'
            'Owner' = 'owner'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludePlanDetails','FilterActivePlans','ContinuationToken','Owner','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/plans' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($PlanId) { $__path += "/$PlanId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}