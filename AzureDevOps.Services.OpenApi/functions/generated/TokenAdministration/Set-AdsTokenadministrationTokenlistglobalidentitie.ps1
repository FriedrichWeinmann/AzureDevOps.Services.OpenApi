function Set-AdsTokenadministrationTokenlistglobalidentitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Revokes the listed OAuth authorizations.

.PARAMETER IsPublic
    Set to false for PAT tokens and true for SSH tokens.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '5.2-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsTokenadministrationTokenlistglobalidentitie -ApiVersion $apiversion

    Revokes the listed OAuth authorizations.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsPublic,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'IsPublic' = 'isPublic'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IsPublic','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/_apis/tokenadministration/tokenlistglobalidentities'

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}