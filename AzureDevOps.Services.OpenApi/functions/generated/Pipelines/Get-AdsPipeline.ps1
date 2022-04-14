function Get-AdsPipeline {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of pipelines.

.PARAMETER ContinuationToken
    A continuation token from a previous request, to retrieve the next page of results

.PARAMETER PipelineVersion
    The pipeline version

.PARAMETER PipelineId
    The pipeline ID

.PARAMETER Top
    The maximum number of pipelines to return

.PARAMETER Project
    Project ID or project name

.PARAMETER OrderBy
    A sort expression. Defaults to "name asc"

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsPipeline -PipelineId $pipelineid -Project $project -Organization $organization -ApiVersion $apiversion

    Gets a pipeline, optionally at the specified version

.EXAMPLE
    PS C:\> Get-AdsPipeline -Project $project -Organization $organization -ApiVersion $apiversion

    Get a list of pipelines.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pipelines_Get')]
        [int32]
        $PipelineVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pipelines_Get')]
        [string]
        $PipelineId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pipelines_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OrderBy,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pipelines_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Pipelines_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'PipelineVersion' = 'pipelineVersion'
            'Top' = '$top'
            'OrderBy' = 'orderBy'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','PipelineVersion','Top','OrderBy','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/pipelines' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($PipelineId) { $__path += "/$PipelineId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}