function Set-AdsTestRunResultAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Attach a file to a test result.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RunId
    ID of the test run that contains the result.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER TestCaseResultId
    ID of the test result against which attachment has to be uploaded.

.EXAMPLE
    PS C:\> Set-AdsTestRunResultAttachment -Organization $organization -RunId $runid -ApiVersion $apiversion -Project $project -TestCaseResultId $testcaseresultid

    Attach a file to a test result.

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
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestCaseResultId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Runs/{runId}/Results/{testCaseResultId}/attachments' -Replace '{organization}',$Organization -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{testCaseResultId}',$TestCaseResultId

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}