function Get-AdsGraphUser {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of all users in a given scope.

Since the list of users may be large, results are returned in pages of users.  If there are more results
 than can be returned in a single page, the result set will contain a continuation token for retrieval of the
 next set of results.

.PARAMETER ContinuationToken
    An opaque data blob that allows the next page of data to resume immediately after where the previous page ended. The only reliable way to know if there is more data left is the presence of a continuation token.

.PARAMETER UserDescriptor
    The descriptor of the desired user.

.PARAMETER ScopeDescriptor
    Specify a non-default scope (collection, project) to search for users.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER SubjectTypes
    A comma separated list of user subject subtypes to reduce the retrieved results, e.g. msa’, ‘aad’, ‘svc’ (service identity), ‘imp’ (imported identity), etc.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsGraphUser -UserDescriptor $userdescriptor -ApiVersion $apiversion -Organization $organization

    Get a user by its descriptor.

.EXAMPLE
    PS C:\> Get-AdsGraphUser -ApiVersion $apiversion -Organization $organization

    Get a list of all users in a given scope.

Since the list of users may be large, results are returned in pages of users.  If there are more results
 than can be returned in a single page, the result set will contain a continuation token for retrieval of the
 next set of results.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Users_Get')]
        [string]
        $UserDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopeDescriptor,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Users_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SubjectTypes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Users_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'ScopeDescriptor' = 'scopeDescriptor'
            'ApiVersion' = 'api-version'
            'SubjectTypes' = 'subjectTypes'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','ScopeDescriptor','ApiVersion','SubjectTypes') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/users' -Replace '{organization}',$Organization
        if ($UserDescriptor) { $__path += "/$UserDescriptor" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}