function Get-AdsTestresultRunResultTestlogstoreendpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get SAS Uri of a test results attachment

.PARAMETER Type
    type of the file

.PARAMETER FilePath
    filePath for which sas uri is needed

.PARAMETER ResultId
    Id of the test result whose files need to be downloaded

.PARAMETER RunId
    Id of the test run that contains result

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsTestresultRunResultTestlogstoreendpoint -Type $type -FilePath $filepath -ResultId $resultid -RunId $runid -Project $project -Organization $organization -ApiVersion $apiversion

    Get SAS Uri of a test results attachment

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilePath,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResultId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Type' = 'type'
            'FilePath' = 'filePath'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Type','FilePath','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/results/{resultId}/testlogstoreendpoint' -Replace '{resultId}',$ResultId -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}