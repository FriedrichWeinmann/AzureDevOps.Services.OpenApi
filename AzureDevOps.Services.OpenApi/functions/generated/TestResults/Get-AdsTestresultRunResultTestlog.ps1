function Get-AdsTestresultRunResultTestlog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get list of test result attachments reference

.PARAMETER RunId
    Id of the test run that contains the result

.PARAMETER DirectoryPath
    directory path of attachments to get

.PARAMETER FileNamePrefix
    file name prefix to filter the list of attachment

.PARAMETER ContinuationToken
    Header to pass the continuationToken

.PARAMETER FetchMetaData
    Default is false, set if metadata is needed

.PARAMETER Top
    Numbe of attachments reference to return

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Type
    type of attachments to get

.PARAMETER ResultId
    Id of the test result

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestresultRunResultTestlog -RunId $runid -ApiVersion $apiversion -Type $type -ResultId $resultid -Project $project -Organization $organization

    Get list of test result attachments reference

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DirectoryPath,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FileNamePrefix,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $FetchMetaData,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

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
            'DirectoryPath' = 'directoryPath'
            'FileNamePrefix' = 'fileNamePrefix'
            'ContinuationToken' = 'continuationToken'
            'FetchMetaData' = 'fetchMetaData'
            'Top' = 'top'
            'ApiVersion' = 'api-version'
            'Type' = 'type'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('DirectoryPath','FileNamePrefix','FetchMetaData','Top','ApiVersion','Type') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken') -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/results/{resultId}/testlog' -Replace '{runId}',$RunId -Replace '{resultId}',$ResultId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}