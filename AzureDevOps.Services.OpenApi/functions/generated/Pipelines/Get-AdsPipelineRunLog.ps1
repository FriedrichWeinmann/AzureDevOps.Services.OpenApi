function Get-AdsPipelineRunLog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of logs from a pipeline run.

.PARAMETER Expand
    Expand options. Default is None.

.PARAMETER PipelineId
    ID of the pipeline.

.PARAMETER RunId
    ID of the run of that pipeline.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER LogId
    ID of the log.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsPipelineRunLog -PipelineId $pipelineid -RunId $runid -Project $project -Organization $organization -LogId $logid -ApiVersion $apiversion

    Get a specific log from a pipeline run

.EXAMPLE
    PS C:\> Get-AdsPipelineRunLog -PipelineId $pipelineid -RunId $runid -Project $project -Organization $organization -ApiVersion $apiversion

    Get a list of logs from a pipeline run.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $PipelineId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $LogId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Logs_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Expand' = '$expand'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expand','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/pipelines/{pipelineId}/runs/{runId}/logs' -Replace '{pipelineId}',$PipelineId -Replace '{runId}',$RunId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($LogId) { $__path += "/$LogId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}