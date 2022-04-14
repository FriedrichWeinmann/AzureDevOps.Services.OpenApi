function New-AdsWorkProcessdefinitionWorkitemtypeLayoutPageSectionGroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Moves a group to a different section

.PARAMETER GroupId
    The ID of the group

.PARAMETER ProcessId
    The ID of the process

.PARAMETER SectionId
    The ID of the section the group is in

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PageId
    The ID of the page the group is in

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER RemoveFromSectionId
    ID of the section to remove the group from

.EXAMPLE
    PS C:\> New-AdsWorkProcessdefinitionWorkitemtypeLayoutPageSectionGroup -GroupId $groupid -ProcessId $processid -SectionId $sectionid -ApiVersion $apiversion -Organization $organization -PageId $pageid -WitRefName $witrefname -RemoveFromSectionId $removefromsectionid

    Moves a group to a different section

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SectionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PageId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RemoveFromSectionId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RemoveFromSectionId' = 'removeFromSectionId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RemoveFromSectionId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workItemTypes/{witRefName}/layout/pages/{pageId}/sections/{sectionId}/groups/{groupId}' -Replace '{groupId}',$GroupId -Replace '{processId}',$ProcessId -Replace '{sectionId}',$SectionId -Replace '{organization}',$Organization -Replace '{pageId}',$PageId -Replace '{witRefName}',$WitRefName

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}