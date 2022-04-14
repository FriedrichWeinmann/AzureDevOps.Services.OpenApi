function Get-AdsReleaseReleaseEnvironmentAttemptTimelineAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    GetTaskAttachments API is deprecated. Use GetReleaseTaskAttachments API instead.

.PARAMETER Type
    Type of the attachment.

.PARAMETER TimelineId
    Timeline Id of the task.

.PARAMETER AttemptId
    Attempt number of deployment.

.PARAMETER Project
    Project ID or project name

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER EnvironmentId
    Id of the release environment.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseEnvironmentAttemptTimelineAttachment -Type $type -TimelineId $timelineid -AttemptId $attemptid -Project $project -ReleaseId $releaseid -Organization $organization -ApiVersion $apiversion -EnvironmentId $environmentid

    GetTaskAttachments API is deprecated. Use GetReleaseTaskAttachments API instead.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TimelineId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AttemptId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EnvironmentId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases/{releaseId}/environments/{environmentId}/attempts/{attemptId}/timelines/{timelineId}/attachments/{type}' -Replace '{type}',$Type -Replace '{timelineId}',$TimelineId -Replace '{attemptId}',$AttemptId -Replace '{project}',$Project -Replace '{releaseId}',$ReleaseId -Replace '{organization}',$Organization -Replace '{environmentId}',$EnvironmentId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}