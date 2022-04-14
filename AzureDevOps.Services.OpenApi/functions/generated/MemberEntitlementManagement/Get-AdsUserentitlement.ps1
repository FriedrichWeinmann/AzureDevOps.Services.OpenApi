function Get-AdsUserEntitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a paged set of user entitlements matching the filter and sort criteria built with properties that match the select input.

.PARAMETER ContinuationToken
    Continuation token for getting the next page of data set. If null is passed, gets the first page.

.PARAMETER Select
    Comma (",") separated list of properties to select in the result entitlements. names of the properties are - 'Projects, 'Extensions' and 'Grouprules'.

.PARAMETER UserId
    ID of the user.

.PARAMETER OrderBy
    PropertyName and Order (separated by a space ( )) to sort on (e.g. lastAccessed desc). Order defaults to ascending. valid properties to order by are dateCreated, lastAccessed, and name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Filter
    Equality operators relating to searching user entitlements seperated by and clauses. Valid filters include: licenseId, licenseStatus, userType, and name. licenseId: filters based on license assignment using license names. i.e. licenseId eq 'Account-Stakeholder' or licenseId eq 'Account-Express'. licenseStatus: filters based on license status. currently only supports disabled. i.e. licenseStatus eq 'Disabled'. To get disabled basic licenses, you would pass (licenseId eq 'Account-Express' and licenseStatus eq 'Disabled') userType: filters off identity type. Suppored types are member or guest i.e. userType eq 'member'. name: filters on if the user's display name or email contians given input. i.e. get all users with "test" in email or displayname is "name eq 'test'". A valid query could be: (licenseId eq 'Account-Stakeholder' or (licenseId eq 'Account-Express' and licenseStatus eq 'Disabled')) and name eq 'test' and userType eq 'guest'.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsUserEntitlement -UserId $userid -Organization $organization -ApiVersion $apiversion

    Get User Entitlement for a user.

.EXAMPLE
    PS C:\> Get-AdsUserEntitlement -Organization $organization -ApiVersion $apiversion

    Get a paged set of user entitlements matching the filter and sort criteria built with properties that match the select input.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Select,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'User Entitlements_Get')]
        [string]
        $UserId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OrderBy,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'User Entitlements_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Filter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'User Entitlements_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Select' = 'select'
            'OrderBy' = '$orderBy'
            'Filter' = '$filter'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Select','OrderBy','Filter','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/userentitlements' -Replace '{organization}',$Organization
        if ($UserId) { $__path += "/$UserId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}