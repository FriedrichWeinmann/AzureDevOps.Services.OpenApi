function Get-AdsReleaseReleaseEnvironmentAttemptTimelineRecordAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    GetTaskAttachmentContent API is deprecated. Use GetReleaseTaskAttachmentContent API instead.

.PARAMETER ReleaseId
    Id of the release.

.PARAMETER RecordId
    Record Id of attachment.

.PARAMETER EnvironmentId
    Id of the release environment.

.PARAMETER TimelineId
    Timeline Id of the task.

.PARAMETER Name
    Name of the attachment.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Type
    Type of the attachment.

.PARAMETER AttemptId
    Attempt number of deployment.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseEnvironmentAttemptTimelineRecordAttachment -ReleaseId $releaseid -RecordId $recordid -EnvironmentId $environmentid -TimelineId $timelineid -Name $name -ApiVersion $apiversion -Type $type -AttemptId $attemptid -Project $project -Organization $organization

    GetTaskAttachmentContent API is deprecated. Use GetReleaseTaskAttachmentContent API instead.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RecordId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EnvironmentId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TimelineId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Type,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AttemptId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases/{releaseId}/environments/{environmentId}/attempts/{attemptId}/timelines/{timelineId}/records/{recordId}/attachments/{type}/{name}' -Replace '{releaseId}',$ReleaseId -Replace '{recordId}',$RecordId -Replace '{environmentId}',$EnvironmentId -Replace '{timelineId}',$TimelineId -Replace '{name}',$Name -Replace '{type}',$Type -Replace '{attemptId}',$AttemptId -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}