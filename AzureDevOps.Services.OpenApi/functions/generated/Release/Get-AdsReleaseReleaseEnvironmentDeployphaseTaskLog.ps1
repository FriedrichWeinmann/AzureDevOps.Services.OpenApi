function Get-AdsReleaseReleaseEnvironmentDeployphaseTaskLog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the task log of a release as a plain text file.

.PARAMETER ReleaseDeployPhaseId
    Release deploy phase Id.

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER EndLine
    Ending line number for logs

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER EnvironmentId
    Id of release environment.

.PARAMETER TaskId
    ReleaseTask Id for the log.

.PARAMETER StartLine
    Starting line number for logs

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseEnvironmentDeployphaseTaskLog -ReleaseDeployPhaseId $releasedeployphaseid -ReleaseId $releaseid -ApiVersion $apiversion -EnvironmentId $environmentid -TaskId $taskid -Project $project -Organization $organization

    Gets the task log of a release as a plain text file.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseDeployPhaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $EndLine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EnvironmentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $StartLine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases/{releaseId}/environments/{environmentId}/deployPhases/{releaseDeployPhaseId}/tasks/{taskId}/logs' -Replace '{releaseDeployPhaseId}',$ReleaseDeployPhaseId -Replace '{releaseId}',$ReleaseId -Replace '{environmentId}',$EnvironmentId -Replace '{taskId}',$TaskId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}