function Get-AdsWorkProcesseWorkitemtypeField {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of all fields in a work item type.

.PARAMETER FieldRefName
    The reference name of the field.

.PARAMETER Expand
    

.PARAMETER ProcessId
    The ID of the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER WitRefName
    The reference name of the work item type.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseWorkitemtypeField -FieldRefName $fieldrefname -ProcessId $processid -Organization $organization -WitRefName $witrefname -ApiVersion $apiversion

    Returns a field in a work item type.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseWorkitemtypeField -ProcessId $processid -Organization $organization -WitRefName $witrefname -ApiVersion $apiversion

    Returns a list of all fields in a work item type.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $FieldRefName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $WitRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Expand' = '$expand'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expand','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/workItemTypes/{witRefName}/fields' -Replace '{processId}',$ProcessId -Replace '{organization}',$Organization -Replace '{witRefName}',$WitRefName
        if ($FieldRefName) { $__path += "/$FieldRefName" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}