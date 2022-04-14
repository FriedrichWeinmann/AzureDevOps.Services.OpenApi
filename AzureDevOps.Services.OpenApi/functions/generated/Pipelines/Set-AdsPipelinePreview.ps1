function Set-AdsPipelinePreview {
<#
.SYNOPSIS
    

.DESCRIPTION
    Queues a dry run of the pipeline and returns an object containing the final yaml.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PipelineVersion
    The pipeline version.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER PipelineId
    The pipeline ID.

.EXAMPLE
    PS C:\> Set-AdsPipelinePreview -Organization $organization -ApiVersion $apiversion -Project $project -PipelineId $pipelineid

    Queues a dry run of the pipeline and returns an object containing the final yaml.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PipelineVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PipelineId
    )
    process {
        $__mapping = @{
            'PipelineVersion' = 'pipelineVersion'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PipelineVersion','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/pipelines/{pipelineId}/preview' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{pipelineId}',$PipelineId

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}