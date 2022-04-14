function Get-AdsCltTestrun {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns test runs based on the filter specified. Returns all runs of the tenant if there is no filter.

.PARAMETER Status
    Filter by the test run status.

.PARAMETER ToDate
    Filter by the test runs that have been modified before the toDate timestamp.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.PARAMETER Runsourceidentifier
    

.PARAMETER Name
    Name for the test run. Names are not unique. Test runs with same name are assigned sequential rolling numbers.

.PARAMETER RunType
    Valid values include: null, one of TestRunType, or "*"

.PARAMETER Top
    The maximum number of test runs to return.

.PARAMETER RetentionState
    

.PARAMETER RequestedBy
    Filter by the user who requested the test run. Here requestedBy should be the display name of the user.

.PARAMETER Detailed
    Include the detailed test run attributes.

.PARAMETER TestRunId
    Unique ID of the test run

.PARAMETER FromDate
    Filter by the test runs that have been modified after the fromDate timestamp.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsCltTestrun -ApiVersion $apiversion -TestRunId $testrunid -Organization $organization

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsCltTestrun -ApiVersion $apiversion -Organization $organization

    Returns test runs based on the filter specified. Returns all runs of the tenant if there is no filter.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ToDate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Runs_Get Test Run')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Runsourceidentifier,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RetentionState,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestedBy,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Detailed,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Runs_Get Test Run')]
        [string]
        $TestRunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FromDate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Runs_Get Test Run')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Status' = 'status'
            'ToDate' = 'toDate'
            'ApiVersion' = 'api-version'
            'Runsourceidentifier' = 'runsourceidentifier'
            'Name' = 'name'
            'RunType' = 'runType'
            'Top' = 'top'
            'RetentionState' = 'retentionState'
            'RequestedBy' = 'requestedBy'
            'Detailed' = 'detailed'
            'FromDate' = 'fromDate'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Status','ToDate','ApiVersion','Runsourceidentifier','Name','RunType','Top','RetentionState','RequestedBy','Detailed','FromDate') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/testruns' -Replace '{organization}',$Organization
        if ($TestRunId) { $__path += "/$TestRunId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}