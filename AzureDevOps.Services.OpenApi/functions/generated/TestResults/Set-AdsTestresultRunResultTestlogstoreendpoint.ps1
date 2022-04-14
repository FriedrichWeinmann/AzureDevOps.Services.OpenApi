function Set-AdsTestresultRunResultTestlogstoreendpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create empty file for a result and Get Sas uri for the file

.PARAMETER FilePath
    file path inside the sub result for which sas uri is needed

.PARAMETER ResultId
    Id of the test results that contains sub result

.PARAMETER Type
    Type of the file for download

.PARAMETER RunId
    Id of the test run that contains the result

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SubResultId
    Id of the test sub result whose file sas uri is needed

.EXAMPLE
    PS C:\> Set-AdsTestresultRunResultTestlogstoreendpoint -FilePath $filepath -ResultId $resultid -Type $type -RunId $runid -Project $project -ApiVersion $apiversion -Organization $organization -SubResultId $subresultid

    Create empty file for a result and Get Sas uri for the file

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilePath,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResultId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $SubResultId
    )
    process {
        $__mapping = @{
            'FilePath' = 'filePath'
            'Type' = 'type'
            'ApiVersion' = 'api-version'
            'SubResultId' = 'subResultId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('FilePath','Type','ApiVersion','SubResultId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/results/{resultId}/testlogstoreendpoint' -Replace '{resultId}',$ResultId -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}