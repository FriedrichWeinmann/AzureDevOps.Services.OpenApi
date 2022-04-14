function Get-AdsAccount {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of accounts for a specific owner or a specific member. One of the following parameters is required: ownerId, memberId.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER MemberId
    ID for a member of the accounts.

.PARAMETER OwnerId
    ID for the owner of the accounts.

.PARAMETER Properties
    

.EXAMPLE
    PS C:\> Get-AdsAccount -ApiVersion $apiversion

    Get a list of accounts for a specific owner or a specific member. One of the following parameters is required: ownerId, memberId.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MemberId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OwnerId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Properties
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'MemberId' = 'memberId'
            'OwnerId' = 'ownerId'
            'Properties' = 'properties'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','MemberId','OwnerId','Properties') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://app.vssps.visualstudio.com/_apis/accounts'

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}