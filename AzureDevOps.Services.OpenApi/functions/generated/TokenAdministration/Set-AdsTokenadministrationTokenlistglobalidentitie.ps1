function Set-AdsTokenadministrationTokenlistglobalidentitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Revokes the listed OAuth authorizations.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '5.2-preview.1' to use this version of the api.

.PARAMETER IsPublic
    Set to false for PAT tokens and true for SSH tokens.

.EXAMPLE
    PS C:\> Set-AdsTokenadministrationTokenlistglobalidentitie -ApiVersion $apiversion

    Revokes the listed OAuth authorizations.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsPublic
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'IsPublic' = 'isPublic'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','IsPublic') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/_apis/tokenadministration/tokenlistglobalidentities'
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}