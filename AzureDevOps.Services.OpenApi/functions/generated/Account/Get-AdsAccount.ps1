function Get-AdsAccount {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of accounts for a specific owner or a specific member. One of the following parameters is required: ownerId, memberId.

.PARAMETER OwnerId
    ID for the owner of the accounts.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Properties
    

.PARAMETER MemberId
    ID for a member of the accounts.

.EXAMPLE
    PS C:\> Get-AdsAccount -ApiVersion $apiversion

    Get a list of accounts for a specific owner or a specific member. One of the following parameters is required: ownerId, memberId.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OwnerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Properties,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MemberId
    )
    process {
        $__mapping = @{
            'OwnerId' = 'ownerId'
            'ApiVersion' = 'api-version'
            'Properties' = 'properties'
            'MemberId' = 'memberId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('OwnerId','ApiVersion','Properties','MemberId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://app.vssps.visualstudio.com/_apis/accounts'
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}