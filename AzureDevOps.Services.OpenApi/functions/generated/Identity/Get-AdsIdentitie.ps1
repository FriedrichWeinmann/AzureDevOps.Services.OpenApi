function Get-AdsIdentitie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Resolve legacy identity information for use with older APIs such as the Security APIs

.PARAMETER QueryMembership
    The membership information to include with the identities. Values can be None for no membership data or Direct to include the groups that the identity is a member of and the identities that are a member of this identity (groups only)

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Descriptors
    A comma separated list of identity descriptors to resolve

.PARAMETER FilterValue
    The search value, as specified by the searchFilter.

.PARAMETER SearchFilter
    The type of search to perform. Values can be AccountName (domain\alias), DisplayName, MailAddress, General (display name, account name, or unique name), or LocalGroupName (only search Azure Devops groups).

.PARAMETER SubjectDescriptors
    A comma seperated list of subject descriptors to resolve

.PARAMETER IdentityIds
    A comma seperated list of storage keys to resolve

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsIdentitie -Organization $organization -ApiVersion $apiversion

    Resolve legacy identity information for use with older APIs such as the Security APIs

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryMembership,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Descriptors,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FilterValue,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SearchFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SubjectDescriptors,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IdentityIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'QueryMembership' = 'queryMembership'
            'Descriptors' = 'descriptors'
            'FilterValue' = 'filterValue'
            'SearchFilter' = 'searchFilter'
            'SubjectDescriptors' = 'subjectDescriptors'
            'IdentityIds' = 'identityIds'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('QueryMembership','Descriptors','FilterValue','SearchFilter','SubjectDescriptors','IdentityIds','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/identities' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}