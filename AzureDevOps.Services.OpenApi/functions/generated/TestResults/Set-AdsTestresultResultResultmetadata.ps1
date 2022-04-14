function Set-AdsTestresultResultResultmetadata {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update properties of test result meta data

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TestCaseReferenceId
    TestCaseReference Id of Test Result to be updated.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsTestresultResultResultmetadata -Organization $organization -TestCaseReferenceId $testcasereferenceid -Project $project -ApiVersion $apiversion

    Update properties of test result meta data

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
        $TestCaseReferenceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/results/resultmetadata/{testCaseReferenceId}' -Replace '{organization}',$Organization -Replace '{testCaseReferenceId}',$TestCaseReferenceId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}