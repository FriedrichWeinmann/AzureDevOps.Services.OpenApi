function Get-AdsReleaseReleaseEnvironmentDeployphaseTaskLog {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the task log of a release as a plain text file.

.PARAMETER EndLine
    Ending line number for logs

.PARAMETER TaskId
    ReleaseTask Id for the log.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER StartLine
    Starting line number for logs

.PARAMETER ReleaseDeployPhaseId
    Release deploy phase Id.

.PARAMETER EnvironmentId
    Id of release environment.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseEnvironmentDeployphaseTaskLog -TaskId $taskid -ApiVersion $apiversion -Project $project -ReleaseId $releaseid -Organization $organization -ReleaseDeployPhaseId $releasedeployphaseid -EnvironmentId $environmentid

    Gets the task log of a release as a plain text file.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $EndLine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TaskId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int64]
        $StartLine,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseDeployPhaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EnvironmentId
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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases/{releaseId}/environments/{environmentId}/deployPhases/{releaseDeployPhaseId}/tasks/{taskId}/logs' -Replace '{taskId}',$TaskId -Replace '{project}',$Project -Replace '{releaseId}',$ReleaseId -Replace '{organization}',$Organization -Replace '{releaseDeployPhaseId}',$ReleaseDeployPhaseId -Replace '{environmentId}',$EnvironmentId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}