function Set-AdsTestresultRunResultTestlogstoreendpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create empty file for a result and Get Sas uri for the file

.PARAMETER Type
    Type of the file for download

.PARAMETER SubResultId
    Id of the test sub result whose file sas uri is needed

.PARAMETER FilePath
    file path inside the sub result for which sas uri is needed

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RunId
    Id of the test run that contains the result

.PARAMETER ResultId
    Id of the test results that contains sub result

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsTestresultRunResultTestlogstoreendpoint -Type $type -SubResultId $subresultid -FilePath $filepath -ApiVersion $apiversion -RunId $runid -ResultId $resultid -Project $project -Organization $organization

    Create empty file for a result and Get Sas uri for the file

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $SubResultId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilePath,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResultId,

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
            'SubResultId' = 'subResultId'
            'FilePath' = 'filePath'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Type','SubResultId','FilePath','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/results/{resultId}/testlogstoreendpoint' -Replace '{runId}',$RunId -Replace '{resultId}',$ResultId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}