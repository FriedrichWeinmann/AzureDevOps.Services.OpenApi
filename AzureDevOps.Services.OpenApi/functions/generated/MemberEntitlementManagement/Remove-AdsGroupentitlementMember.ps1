function Remove-AdsGroupentitlementMember {
<#
.SYNOPSIS
    

.DESCRIPTION
    Remove a member from a Group.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER GroupId
    Id of the group.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER MemberId
    Id of the member to remove.

.EXAMPLE
    PS C:\> Remove-AdsGroupentitlementMember -ApiVersion $apiversion -GroupId $groupid -Organization $organization -MemberId $memberid

    Remove a member from a Group.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MemberId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/GroupEntitlements/{groupId}/members/{memberId}' -Replace '{groupId}',$GroupId -Replace '{organization}',$Organization -Replace '{memberId}',$MemberId
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}