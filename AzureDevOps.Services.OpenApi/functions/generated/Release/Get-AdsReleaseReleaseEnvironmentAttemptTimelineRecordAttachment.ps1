function Get-AdsReleaseReleaseEnvironmentAttemptTimelineRecordAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    GetTaskAttachmentContent API is deprecated. Use GetReleaseTaskAttachmentContent API instead.

.PARAMETER Type
    Type of the attachment.

.PARAMETER RecordId
    Record Id of attachment.

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

.PARAMETER Name
    Name of the attachment.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER EnvironmentId
    Id of the release environment.

.EXAMPLE
    PS C:\> Get-AdsReleaseReleaseEnvironmentAttemptTimelineRecordAttachment -Type $type -RecordId $recordid -TimelineId $timelineid -AttemptId $attemptid -Project $project -ReleaseId $releaseid -Organization $organization -Name $name -ApiVersion $apiversion -EnvironmentId $environmentid

    GetTaskAttachmentContent API is deprecated. Use GetReleaseTaskAttachmentContent API instead.

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
        $RecordId,

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
        $Name,

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
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/releases/{releaseId}/environments/{environmentId}/attempts/{attemptId}/timelines/{timelineId}/records/{recordId}/attachments/{type}/{name}' -Replace '{type}',$Type -Replace '{recordId}',$RecordId -Replace '{timelineId}',$TimelineId -Replace '{attemptId}',$AttemptId -Replace '{project}',$Project -Replace '{releaseId}',$ReleaseId -Replace '{organization}',$Organization -Replace '{name}',$Name -Replace '{environmentId}',$EnvironmentId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}