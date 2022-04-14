function Get-AdsGroupentitlementMember {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get direct members of a Group.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER GroupId
    Id of the Group.

.PARAMETER MaxResults
    Maximum number of results to retrieve.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PagingToken
    Paging Token from the previous page fetched. If the 'pagingToken' is null, the results would be fetched from the beginning of the Members List.

.EXAMPLE
    PS C:\> Get-AdsGroupentitlementMember -ApiVersion $apiversion -GroupId $groupid -Organization $organization

    Get direct members of a Group.

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

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxResults,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PagingToken
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'MaxResults' = 'maxResults'
            'PagingToken' = 'pagingToken'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','MaxResults','PagingToken') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/GroupEntitlements/{groupId}/members' -Replace '{groupId}',$GroupId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}