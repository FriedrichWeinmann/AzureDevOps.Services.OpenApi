function Get-AdsTestresultRunResultTestlog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get list of test result attachments reference

.PARAMETER ContinuationToken
    Header to pass the continuationToken

.PARAMETER Type
    type of attachments to get

.PARAMETER FetchMetaData
    Default is false, set if metadata is needed

.PARAMETER FileNamePrefix
    file name prefix to filter the list of attachment

.PARAMETER ResultId
    Id of the test result

.PARAMETER RunId
    Id of the test run that contains the result

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DirectoryPath
    directory path of attachments to get

.PARAMETER Top
    Numbe of attachments reference to return

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsTestresultRunResultTestlog

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsTestresultRunResultTestlog -Type $type -ResultId $resultid -RunId $runid -Project $project -Organization $organization -ApiVersion $apiversion

    Get list of test result attachments reference

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = '')]
        [string]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $FetchMetaData,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FileNamePrefix,

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

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DirectoryPath,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Type' = 'type'
            'FetchMetaData' = 'fetchMetaData'
            'FileNamePrefix' = 'fileNamePrefix'
            'DirectoryPath' = 'directoryPath'
            'Top' = 'top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Type','FetchMetaData','FileNamePrefix','DirectoryPath','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken') -Mapping $__mapping
        $__path = 'https://vstmr.dev.azure.com/{organization}/{project}/_apis/testresults/runs/{runId}/results/{resultId}/testlog' -Replace '{resultId}',$ResultId -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}