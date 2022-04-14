function Get-AdsTestplanSuiteentry {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test suite entries in the test suite.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER SuiteEntryType
    

.PARAMETER Project
    Project ID or project name

.PARAMETER SuiteId
    Id of the parent suite.

.EXAMPLE
    PS C:\> Get-AdsTestplanSuiteentry -Organization $organization -ApiVersion $apiversion -Project $project -SuiteId $suiteid

    Get a list of test suite entries in the test suite.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SuiteEntryType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SuiteId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'SuiteEntryType' = 'suiteEntryType'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','SuiteEntryType') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/testplan/suiteentry/{suiteId}' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{suiteId}',$SuiteId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}