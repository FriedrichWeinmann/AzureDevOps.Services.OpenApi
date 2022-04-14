function Set-AdsTestresultRunTestlogstoreendpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create empty file for a run and Get Sas uri for the file

.PARAMETER Type
    Default is GeneralAttachment, type of empty file to be created

.PARAMETER RunId
    Id of the run to get endpoint details

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER TestLogStoreOperationType
    Type of operation to perform using sas uri

.PARAMETER FilePath
    file path to create an empty file

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsTestresultRunTestlogstoreendpoint -RunId $runid -ApiVersion $apiversion -TestLogStoreOperationType $testlogstoreoperationtype -Project $project -Organization $organization

    Create empty file for a run and Get Sas uri for the file

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestLogStoreOperationType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilePath,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Type' = 'type'
            'ApiVersion' = 'api-version'
            'TestLogStoreOperationType' = 'testLogStoreOperationType'
            'FilePath' = 'filePath'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Type','ApiVersion','TestLogStoreOperationType','FilePath') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/testlogstoreendpoint' -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}