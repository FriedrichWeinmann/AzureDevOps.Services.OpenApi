function Get-AdsTestresultRunTestlogstoreendpoint {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get SAS Uri of a test run attachment

.PARAMETER Type
    type of the file

.PARAMETER FilePath
    filePath for which sas uri is needed

.PARAMETER Project
    Project ID or project name

.PARAMETER RunId
    Id of the test run whose file has to be downloaded

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsTestresultRunTestlogstoreendpoint -Type $type -FilePath $filepath -Project $project -RunId $runid -Organization $organization -ApiVersion $apiversion

    Get SAS Uri of a test run attachment

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
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunId,

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
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/testlogstoreendpoint' -Replace '{project}',$Project -Replace '{runId}',$RunId -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}