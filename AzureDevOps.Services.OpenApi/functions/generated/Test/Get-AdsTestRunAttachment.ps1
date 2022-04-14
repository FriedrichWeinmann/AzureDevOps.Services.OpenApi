function Get-AdsTestRunAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get list of test run attachments reference.

.PARAMETER RunId
    ID of the test run.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER AttachmentId
    ID of the test run attachment to be downloaded.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Project
    Project ID or project name

.EXAMPLE
    PS C:\> Get-AdsTestRunAttachment -RunId $runid -ApiVersion $apiversion -Organization $organization -Project $project

    Get list of test run attachments reference.

.EXAMPLE
    PS C:\> Get-AdsTestRunAttachment -RunId $runid -ApiVersion $apiversion -AttachmentId $attachmentid -Organization $organization -Project $project

    Download a test run attachment by its ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Run Attachment Zip')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Run Attachment Zip')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Run Attachment Zip')]
        [string]
        $AttachmentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Run Attachment Zip')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Attachments_Get Test Run Attachment Zip')]
        [string]
        $Project
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/Runs/{runId}/attachments' -Replace '{runId}',$RunId -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($AttachmentId) { $__path += "/$AttachmentId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}