function Get-AdsBuildStatu {
<#
.SYNOPSIS
    

.DESCRIPTION
    <p>Gets the build status for a definition, optionally scoped to a specific branch, stage, job, and configuration.</p> <p>If there are more than one, then it is required to pass in a stageName value when specifying a jobName, and the same rule then applies for both if passing a configuration parameter.</p>

.PARAMETER JobName
    Use this job within a stage of the pipeline to render the status.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER BranchName
    Only consider the most recent build for this branch. If not specified, the default branch is used.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER Definition
    Either the definition name with optional leading folder path, or the definition id.

.PARAMETER StageName
    Use this stage within the pipeline to render the status.

.PARAMETER Label
    Replaces the default text on the left side of the badge.

.PARAMETER Configuration
    Use this job configuration to render the status

.EXAMPLE
    PS C:\> Get-AdsBuildStatu -Organization $organization -ApiVersion $apiversion -Project $project -Definition $definition

    <p>Gets the build status for a definition, optionally scoped to a specific branch, stage, job, and configuration.</p> <p>If there are more than one, then it is required to pass in a stageName value when specifying a jobName, and the same rule then applies for both if passing a configuration parameter.</p>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $JobName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BranchName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Definition,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StageName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Label,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Configuration
    )
    process {
        $__mapping = @{
            'JobName' = 'jobName'
            'BranchName' = 'branchName'
            'ApiVersion' = 'api-version'
            'StageName' = 'stageName'
            'Label' = 'label'
            'Configuration' = 'configuration'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('JobName','BranchName','ApiVersion','StageName','Label','Configuration') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/status/{definition}' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{definition}',$Definition

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}