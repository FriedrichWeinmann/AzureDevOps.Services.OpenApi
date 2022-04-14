function Set-AdsTokenadministrationTokenpersonalaccesstoken {
<#
.SYNOPSIS
    

.DESCRIPTION
    Lists of all the session token details of the personal access tokens (PATs) for a particular user.

.PARAMETER PageSize
    The maximum number of results to return on each page.

.PARAMETER SubjectDescriptor
    The descriptor of the target user.

.PARAMETER IsPublic
    Set to false for PAT tokens and true for SSH tokens.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '5.2-preview.1' to use this version of the api.

.PARAMETER ContinuationToken
    An opaque data blob that allows the next page of data to resume immediately after where the previous page ended. The only reliable way to know if there is more data left is the presence of a continuation token.

.EXAMPLE
    PS C:\> Set-AdsTokenadministrationTokenpersonalaccesstoken -SubjectDescriptor $subjectdescriptor -ApiVersion $apiversion

    Lists of all the session token details of the personal access tokens (PATs) for a particular user.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PageSize,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SubjectDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IsPublic,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken
    )
    process {
        $__mapping = @{
            'PageSize' = 'pageSize'
            'IsPublic' = 'isPublic'
            'ApiVersion' = 'api-version'
            'ContinuationToken' = 'continuationToken'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('PageSize','IsPublic','ApiVersion','ContinuationToken') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/_apis/tokenadministration/tokenpersonalaccesstokens/{subjectDescriptor}' -Replace '{subjectDescriptor}',$SubjectDescriptor
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}