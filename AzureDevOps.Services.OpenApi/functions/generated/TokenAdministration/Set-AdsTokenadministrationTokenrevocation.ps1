function Set-AdsTokenadministrationTokenrevocation {
<#
.SYNOPSIS
    

.DESCRIPTION
    Revokes the listed OAuth authorizations.

.PARAMETER HostId
    Host Id to display on the notification page to manage tokens.

.PARAMETER IsPublic
    Set to false for PAT tokens and true for SSH tokens.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '5.2-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsTokenadministrationTokenrevocation -HostId $hostid -ApiVersion $apiversion

    Revokes the listed OAuth authorizations.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $HostId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsPublic,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'HostId' = 'hostId'
            'IsPublic' = 'isPublic'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('HostId','IsPublic','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/_apis/tokenadministration/tokenrevocations'

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}