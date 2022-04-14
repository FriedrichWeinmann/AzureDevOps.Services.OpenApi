function Remove-AdsWorkProcessdefinitionWorkitemtypeLayoutPage {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a page from the work item form

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProcessId
    The ID of the process

.PARAMETER PageId
    The ID of the page

.PARAMETER WitRefName
    The reference name of the work item type

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsWorkProcessdefinitionWorkitemtypeLayoutPage -Organization $organization -ProcessId $processid -PageId $pageid -WitRefName $witrefname -ApiVersion $apiversion

    Removes a page from the work item form

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PageId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workItemTypes/{witRefName}/layout/pages/{pageId}' -Replace '{organization}',$Organization -Replace '{processId}',$ProcessId -Replace '{pageId}',$PageId -Replace '{witRefName}',$WitRefName

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}