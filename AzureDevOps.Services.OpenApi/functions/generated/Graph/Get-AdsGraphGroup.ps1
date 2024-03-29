﻿function Get-AdsGraphGroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets a list of all groups in the current scope (usually organization or account).

The optional parameters are used to filter down the returned results. Returned results are in no guaranteed order.

 Since the list of groups may be large, results are returned in pages of groups.  If there are more results
 than can be returned in a single page, the result set will contain a continuation token for retrieval of the
 next set of results.

.PARAMETER ContinuationToken
    An opaque data blob that allows the next page of data to resume immediately after where the previous page ended. The only reliable way to know if there is more data left is the presence of a continuation token.

.PARAMETER GroupDescriptor
    The descriptor of the desired graph group.

.PARAMETER SubjectTypes
    A comma separated list of user subject subtypes to reduce the retrieved results, e.g. Microsoft.IdentityModel.Claims.ClaimsIdentity

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ScopeDescriptor
    Specify a non-default scope (collection, project) to search for groups.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGraphGroup -Organization $organization -ApiVersion $apiversion

    Gets a list of all groups in the current scope (usually organization or account).

The optional parameters are used to filter down the returned results. Returned results are in no guaranteed order.

 Since the list of groups may be large, results are returned in pages of groups.  If there are more results
 than can be returned in a single page, the result set will contain a continuation token for retrieval of the
 next set of results.

.EXAMPLE
    PS C:\> Get-AdsGraphGroup -GroupDescriptor $groupdescriptor -Organization $organization -ApiVersion $apiversion

    Get a group by its descriptor.

The group will be returned even if it has been deleted from the account or has had all its memberships
deleted.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Groups_Get')]
        [string]
        $GroupDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SubjectTypes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Groups_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopeDescriptor,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Groups_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'SubjectTypes' = 'subjectTypes'
            'ScopeDescriptor' = 'scopeDescriptor'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','SubjectTypes','ScopeDescriptor','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/groups' -Replace '{organization}',$Organization
        if ($GroupDescriptor) { $__path += "/$GroupDescriptor" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}