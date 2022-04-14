function Get-AdsBuildBuildLog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the logs for a build.

.PARAMETER EndLine
    The end line.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER StartLine
    The start line.

.PARAMETER LogId
    The ID of the log file.

.PARAMETER BuildId
    The ID of the build.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsBuildBuildLog -ApiVersion $apiversion -BuildId $buildid -Project $project -Organization $organization

    Gets the logs for a build.

.EXAMPLE
    PS C:\> Get-AdsBuildBuildLog -ApiVersion $apiversion -LogId $logid -BuildId $buildid -Project $project -Organization $organization

    Gets an individual log file for a build.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [int64]
        $EndLine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [int64]
        $StartLine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [string]
        $LogId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [string]
        $BuildId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Get Build Log')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'EndLine' = 'endLine'
            'ApiVersion' = 'api-version'
            'StartLine' = 'startLine'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('EndLine','ApiVersion','StartLine') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/builds/{buildId}/logs' -Replace '{buildId}',$BuildId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($LogId) { $__path += "/$LogId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}