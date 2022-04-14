function Set-AdsWorkProcessadminProcesseImport {
<#
.SYNOPSIS
    

.DESCRIPTION
    Imports a process from zip file.

.PARAMETER ReplaceExistingTemplate
    Replaces the existing template. Default value is true.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IgnoreWarnings
    Ignores validation warnings. Default value is false.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsWorkProcessadminProcesseImport -ApiVersion $apiversion -Organization $organization

    Imports a process from zip file.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ReplaceExistingTemplate,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IgnoreWarnings,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ReplaceExistingTemplate' = 'replaceExistingTemplate'
            'ApiVersion' = 'api-version'
            'IgnoreWarnings' = 'ignoreWarnings'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ReplaceExistingTemplate','ApiVersion','IgnoreWarnings') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processadmin/processes/import' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}