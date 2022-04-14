function Get-AdsTokenadminPersonalaccesstoken {
<#
.SYNOPSIS
    

.DESCRIPTION
    Lists of all the session token details of the personal access tokens (PATs) for a particular user.

.PARAMETER SubjectDescriptor
    The descriptor of the target user.

.PARAMETER ContinuationToken
    An opaque data blob that allows the next page of data to resume immediately after where the previous page ended. The only reliable way to know if there is more data left is the presence of a continuation token.

.PARAMETER IsPublic
    Set to false for PAT tokens and true for SSH tokens.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER PageSize
    The maximum number of results to return on each page.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTokenadminPersonalaccesstoken -SubjectDescriptor $subjectdescriptor -ApiVersion $apiversion -Organization $organization

    Lists of all the session token details of the personal access tokens (PATs) for a particular user.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SubjectDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsPublic,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PageSize,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'IsPublic' = 'isPublic'
            'ApiVersion' = 'api-version'
            'PageSize' = 'pageSize'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','IsPublic','ApiVersion','PageSize') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/tokenadmin/personalaccesstokens/{subjectDescriptor}' -Replace '{subjectDescriptor}',$SubjectDescriptor -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}