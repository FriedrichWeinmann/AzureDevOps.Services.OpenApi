function Get-AdsTestRunResultAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get list of test result attachments reference.

.PARAMETER AttachmentId
    ID of the test result attachment to be downloaded.

.PARAMETER RunId
    ID of the test run that contains the result.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER TestCaseResultId
    ID of the test result.

.EXAMPLE
    PS C:\> Get-AdsTestRunResultAttachment -AttachmentId $attachmentid -RunId $runid -Project $project -ApiVersion $apiversion -Organization $organization -TestCaseResultId $testcaseresultid

    Download a test result attachment by its ID.

.EXAMPLE
    PS C:\> Get-AdsTestRunResultAttachment -RunId $runid -Project $project -ApiVersion $apiversion -Organization $organization -TestCaseResultId $testcaseresultid

    Get list of test result attachments reference.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Result Attachment Zip')]
        [string]
        $AttachmentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Result Attachment Zip')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Result Attachment Zip')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Result Attachment Zip')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Result Attachment Zip')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Result Attachment Zip')]
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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Runs/{runId}/Results/{testCaseResultId}/attachments' -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{testCaseResultId}',$TestCaseResultId
        if ($AttachmentId) { $__path += "/$AttachmentId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}