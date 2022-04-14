function Set-AdsTokenadministrationTokenrevocation {
<#
.SYNOPSIS
    

.DESCRIPTION
    Revokes the listed OAuth authorizations.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '5.2-preview.1' to use this version of the api.

.PARAMETER IsPublic
    Set to false for PAT tokens and true for SSH tokens.

.PARAMETER HostId
    Host Id to display on the notification page to manage tokens.

.EXAMPLE
    PS C:\> Set-AdsTokenadministrationTokenrevocation -ApiVersion $apiversion -HostId $hostid

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
        $IsPublic,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $HostId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'IsPublic' = 'isPublic'
            'HostId' = 'hostId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','IsPublic','HostId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/_apis/tokenadministration/tokenrevocations'
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}