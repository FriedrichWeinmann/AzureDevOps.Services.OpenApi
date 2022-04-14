function Get-AdsCltTestrun {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns test runs based on the filter specified. Returns all runs of the tenant if there is no filter.

.PARAMETER Name
    Name for the test run. Names are not unique. Test runs with same name are assigned sequential rolling numbers.

.PARAMETER TestRunId
    Unique ID of the test run

.PARAMETER Status
    Filter by the test run status.

.PARAMETER Detailed
    Include the detailed test run attributes.

.PARAMETER Top
    The maximum number of test runs to return.

.PARAMETER RetentionState
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FromDate
    Filter by the test runs that have been modified after the fromDate timestamp.

.PARAMETER RunType
    Valid values include: null, one of TestRunType, or "*"

.PARAMETER Runsourceidentifier
    

.PARAMETER ToDate
    Filter by the test runs that have been modified before the toDate timestamp.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '6.1-preview.1' to use this version of the api.

.PARAMETER RequestedBy
    Filter by the user who requested the test run. Here requestedBy should be the display name of the user.

.EXAMPLE
    PS C:\> Get-AdsCltTestrun -TestRunId $testrunid -Organization $organization -ApiVersion $apiversion

    <insert description here>

.EXAMPLE
    PS C:\> Get-AdsCltTestrun -Organization $organization -ApiVersion $apiversion

    Returns test runs based on the filter specified. Returns all runs of the tenant if there is no filter.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Runs_Get Test Run')]
        [string]
        $TestRunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Status,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Detailed,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RetentionState,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Runs_Get Test Run')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FromDate,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RunType,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Runsourceidentifier,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ToDate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Test Runs_Get Test Run')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RequestedBy
    )
    process {
        $__mapping = @{
            'Name' = 'name'
            'Status' = 'status'
            'Detailed' = 'detailed'
            'Top' = 'top'
            'RetentionState' = 'retentionState'
            'FromDate' = 'fromDate'
            'RunType' = 'runType'
            'Runsourceidentifier' = 'runsourceidentifier'
            'ToDate' = 'toDate'
            'ApiVersion' = 'api-version'
            'RequestedBy' = 'requestedBy'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Name','Status','Detailed','Top','RetentionState','FromDate','RunType','Runsourceidentifier','ToDate','ApiVersion','RequestedBy') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsclt.dev.azure.com/{organization}/_apis/clt/testruns' -Replace '{organization}',$Organization
        if ($TestRunId) { $__path += "/$TestRunId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}