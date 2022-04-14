function Get-AdsWorkProcessdefinitionWorkitemtypeField {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of all fields in the work item type of the process.

.PARAMETER WitRefNameForFields
    Work item type reference name for fields

.PARAMETER ProcessId
    The ID of the process

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER FieldRefName
    The reference name of the field

.EXAMPLE
    PS C:\> Get-AdsWorkProcessdefinitionWorkitemtypeField -WitRefNameForFields $witrefnameforfields -ProcessId $processid -ApiVersion $apiversion -Organization $organization -FieldRefName $fieldrefname

    Returns a single field in the work item type of the process.

.EXAMPLE
    PS C:\> Get-AdsWorkProcessdefinitionWorkitemtypeField -WitRefNameForFields $witrefnameforfields -ProcessId $processid -ApiVersion $apiversion -Organization $organization

    Returns a list of all fields in the work item type of the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $WitRefNameForFields,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $FieldRefName
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/workItemTypes/{witRefNameForFields}/fields' -Replace '{witRefNameForFields}',$WitRefNameForFields -Replace '{processId}',$ProcessId -Replace '{organization}',$Organization
        if ($FieldRefName) { $__path += "/$FieldRefName" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}