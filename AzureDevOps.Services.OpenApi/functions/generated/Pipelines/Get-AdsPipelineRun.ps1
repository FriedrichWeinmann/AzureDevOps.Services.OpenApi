function Get-AdsPipelineRun {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets top 10000 runs for a particular pipeline.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER RunId
    The run id

.PARAMETER Project
    Project ID or project name

.PARAMETER PipelineId
    The pipeline id

.EXAMPLE
    PS C:\> Get-AdsPipelineRun -Organization $organization -ApiVersion $apiversion -RunId $runid -Project $project -PipelineId $pipelineid

    Gets a run for a particular pipeline.

.EXAMPLE
    PS C:\> Get-AdsPipelineRun -Organization $organization -ApiVersion $apiversion -Project $project -PipelineId $pipelineid

    Gets top 10000 runs for a particular pipeline.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get')]
        [string]
        $RunId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Runs_Get')]
        [string]
        $PipelineId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/pipelines/{pipelineId}/runs' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{pipelineId}',$PipelineId
        if ($RunId) { $__path += "/$RunId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}