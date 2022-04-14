function Get-AdsCltTestrunCounterinstance {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.PARAMETER GroupNames
    Comma separated names of counter groups, such as 'Application', 'Performance' and 'Throughput'

.PARAMETER TestRunId
    The test run identifier

.PARAMETER IncludeSummary
    

.EXAMPLE
    PS C:\> Get-AdsCltTestrunCounterinstance -Organization $organization -ApiVersion $apiversion -GroupNames $groupnames -TestRunId $testrunid

    <insert description here>

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

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupNames,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TestRunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeSummary
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'GroupNames' = 'groupNames'
            'IncludeSummary' = 'includeSummary'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','GroupNames','IncludeSummary') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/testRuns/{testRunId}/counterinstances' -Replace '{organization}',$Organization -Replace '{testRunId}',$TestRunId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}