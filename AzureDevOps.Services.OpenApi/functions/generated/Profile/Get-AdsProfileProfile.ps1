function Get-AdsProfileProfile {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a user profile.

.PARAMETER CoreAttributes
    A comma-delimited list of core profile attributes to return. Valid values are Email, Avatar, DisplayName, and ContactWithOffers.

.PARAMETER Details
    Return public profile information such as display name, email address, country, etc. If false, the withAttributes parameter is ignored.

.PARAMETER WithAttributes
    If true, gets the attributes (named key-value pairs of arbitrary data) associated with the profile. The partition parameter must also have a value.

.PARAMETER Id
    The ID of the target user profile within the same organization, or 'me' to get the profile of the current authenticated user.

.PARAMETER Partition
    The partition (named group) of attributes to return.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER ForceRefresh
    Not used in this version of the API.

.EXAMPLE
    PS C:\> Get-AdsProfileProfile -Id $id -ApiVersion $apiversion

    Gets a user profile.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CoreAttributes,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $Details,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $WithAttributes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Id,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Partition,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ForceRefresh
    )
    process {
        $__mapping = @{
            'CoreAttributes' = 'coreAttributes'
            'Details' = 'details'
            'WithAttributes' = 'withAttributes'
            'Partition' = 'partition'
            'ApiVersion' = 'api-version'
            'ForceRefresh' = 'forceRefresh'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('CoreAttributes','Details','WithAttributes','Partition','ApiVersion','ForceRefresh') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://app.vssps.visualstudio.com/_apis/profile/profiles/{id}' -Replace '{id}',$Id

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}