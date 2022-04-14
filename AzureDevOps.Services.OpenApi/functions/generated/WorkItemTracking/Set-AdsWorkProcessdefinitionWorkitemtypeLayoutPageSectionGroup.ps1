﻿function Set-AdsWorkProcessdefinitionWorkitemtypeLayoutPageSectionGroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Adds a group to the work item form

.PARAMETER PageId
    The ID of the page to add the group to

.PARAMETER ProcessId
    The ID of the process

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.PARAMETER SectionId
    The ID of the section to add the group to

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsWorkProcessdefinitionWorkitemtypeLayoutPageSectionGroup -PageId $pageid -ProcessId $processid -WitRefName $witrefname -ApiVersion $apiversion -SectionId $sectionid -Organization $organization

    Adds a group to the work item form

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
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
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workItemTypes/{witRefName}/layout/pages/{pageId}/sections/{sectionId}/groups' -Replace '{pageId}',$PageId -Replace '{processId}',$ProcessId -Replace '{witRefName}',$WitRefName -Replace '{sectionId}',$SectionId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}