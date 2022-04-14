function New-AdsWorkProcesseWorkitemtypeLayoutPageSectionGroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Moves a group to a different section.

.PARAMETER GroupId
    The ID of the group.

.PARAMETER PageId
    The ID of the page the group is in.

.PARAMETER ProcessId
    The ID of the process.

.PARAMETER WitRefName
    The reference name of the work item type.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER SectionId
    The ID of the section the group is in.

.PARAMETER RemoveFromSectionId
    ID of the section to remove the group from.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> New-AdsWorkProcesseWorkitemtypeLayoutPageSectionGroup -GroupId $groupid -PageId $pageid -ProcessId $processid -WitRefName $witrefname -ApiVersion $apiversion -SectionId $sectionid -RemoveFromSectionId $removefromsectionid -Organization $organization

    Moves a group to a different section.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PageId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SectionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RemoveFromSectionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RemoveFromSectionId' = 'removeFromSectionId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RemoveFromSectionId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/layout/pages/{pageId}/sections/{sectionId}/groups/{groupId}' -Replace '{groupId}',$GroupId -Replace '{pageId}',$PageId -Replace '{processId}',$ProcessId -Replace '{witRefName}',$WitRefName -Replace '{sectionId}',$SectionId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}