function Get-AdsTestRun {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of test runs.

.PARAMETER TmiRunId
    

.PARAMETER PlanId
    ID of the test plan that the runs are a part of.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Top
    Number of test runs to return.

.PARAMETER IncludeDetails
    Default value is true. It includes details like run statistics, release, build, test environment, post process state, and more.

.PARAMETER Skip
    Number of test runs to skip.

.PARAMETER RunId
    ID of the run to get.

.PARAMETER BuildUri
    URI of the build that the runs used.

.PARAMETER IncludeRunDetails
    If true, include all the properties of the runs.

.PARAMETER Project
    Project ID or project name

.PARAMETER Owner
    Team foundation ID of the owner of the runs.

.PARAMETER Automated
    If true, only returns automated runs.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTestRun -ApiVersion $apiversion -RunId $runid -Project $project -Organization $organization

    Get a test run by its ID.

.EXAMPLE
    PS C:\> Get-AdsTestRun -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of test runs.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TmiRunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PlanId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [boolean]
        $IncludeDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $RunId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildUri,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeRunDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Automated,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get Test Run By Id')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'TmiRunId' = 'tmiRunId'
            'PlanId' = 'planId'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
            'IncludeDetails' = 'includeDetails'
            'Skip' = '$skip'
            'BuildUri' = 'buildUri'
            'IncludeRunDetails' = 'includeRunDetails'
            'Owner' = 'owner'
            'Automated' = 'automated'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('TmiRunId','PlanId','ApiVersion','Top','IncludeDetails','Skip','BuildUri','IncludeRunDetails','Owner','Automated') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/runs' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($RunId) { $__path += "/$RunId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}