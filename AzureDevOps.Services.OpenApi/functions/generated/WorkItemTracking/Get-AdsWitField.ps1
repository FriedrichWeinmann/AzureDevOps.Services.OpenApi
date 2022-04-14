function Get-AdsWitField {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns information for all fields. The project ID/name parameter is optional.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Expand
    Use ExtensionFields to include extension fields, otherwise exclude them. Unless the feature flag for this parameter is enabled, extension fields are always included.

.PARAMETER FieldNameOrRefName
    Field simple name or reference name

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitField -Organization $organization -FieldNameOrRefName $fieldnameorrefname -Project $project -ApiVersion $apiversion

    Gets information on a specific field.

.EXAMPLE
    PS C:\> Get-AdsWitField -Organization $organization -Project $project -ApiVersion $apiversion

    Returns information for all fields. The project ID/name parameter is optional.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $FieldNameOrRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Fields_Get')]
        [string]
        $Project,

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
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/fields' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($FieldNameOrRefName) { $__path += "/$FieldNameOrRefName" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}