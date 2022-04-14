function Get-AdsTestRun {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test runs.

.PARAMETER RunId
    ID of the run to get.

.PARAMETER Owner
    Team foundation ID of the owner of the runs.

.PARAMETER Skip
    Number of test runs to skip.

.PARAMETER IncludeRunDetails
    If true, include all the properties of the runs.

.PARAMETER TmiRunId
    

.PARAMETER BuildUri
    URI of the build that the runs used.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PlanId
    ID of the test plan that the runs are a part of.

.PARAMETER IncludeDetails
    Default value is true. It includes details like run statistics, release, build, test environment, post process state, and more.

.PARAMETER Project
    Project ID or project name

.PARAMETER Top
    Number of test runs to return.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Automated
    If true, only returns automated runs.

.EXAMPLE
    PS C:\> Get-AdsTestRun -RunId $runid -Organization $organization -Project $project -ApiVersion $apiversion

    Get a test run by its ID.

.EXAMPLE
    PS C:\> Get-AdsTestRun -Organization $organization -Project $project -ApiVersion $apiversion

    Get a list of test runs.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $RunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeRunDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TmiRunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildUri,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PlanId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [boolean]
        $IncludeDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Automated
    )
    process {
        $__mapping = @{
            'Owner' = 'owner'
            'Skip' = '$skip'
            'IncludeRunDetails' = 'includeRunDetails'
            'TmiRunId' = 'tmiRunId'
            'BuildUri' = 'buildUri'
            'PlanId' = 'planId'
            'IncludeDetails' = 'includeDetails'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
            'Automated' = 'automated'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Owner','Skip','IncludeRunDetails','TmiRunId','BuildUri','PlanId','IncludeDetails','Top','ApiVersion','Automated') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/runs' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($RunId) { $__path += "/$RunId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}