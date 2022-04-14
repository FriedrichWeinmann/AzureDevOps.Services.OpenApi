function Set-AdsWorkProcessdefinitionWorkitemtypeField {
<#
.SYNOPSIS
    

.DESCRIPTION
    Adds a field to the work item type in the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER WitRefNameForFields
    Work item type reference name for the field

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsWorkProcessdefinitionWorkitemtypeField -Organization $organization -WitRefNameForFields $witrefnameforfields -ProcessId $processid -ApiVersion $apiversion

    Adds a field to the work item type in the process.

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
        $WitRefNameForFields,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workItemTypes/{witRefNameForFields}/fields' -Replace '{organization}',$Organization -Replace '{witRefNameForFields}',$WitRefNameForFields -Replace '{processId}',$ProcessId

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}