function Get-AdsGroupEntitlementMember {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get direct members of a Group.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER GroupId
    Id of the Group.

.PARAMETER PagingToken
    Paging Token from the previous page fetched. If the 'pagingToken' is null, the results would be fetched from the beginning of the Members List.

.PARAMETER MaxResults
    Maximum number of results to retrieve.

.EXAMPLE
    PS C:\> Get-AdsGroupEntitlementMember -Organization $organization -ApiVersion $apiversion -GroupId $groupid

    Get direct members of a Group.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PagingToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxResults
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'PagingToken' = 'pagingToken'
            'MaxResults' = 'maxResults'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','PagingToken','MaxResults') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/GroupEntitlements/{groupId}/members' -Replace '{organization}',$Organization -Replace '{groupId}',$GroupId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}