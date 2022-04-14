function Set-AdsTokenadministrationTokenpersonalaccesstoken {
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

.PARAMETER PageSize
    The maximum number of results to return on each page.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '5.2-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsTokenadministrationTokenpersonalaccesstoken -SubjectDescriptor $subjectdescriptor -ApiVersion $apiversion

    Lists of all the session token details of the personal access tokens (PATs) for a particular user.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
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

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $PageSize,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'IsPublic' = 'isPublic'
            'PageSize' = 'pageSize'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','IsPublic','PageSize','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/_apis/tokenadministration/tokenpersonalaccesstokens/{subjectDescriptor}' -Replace '{subjectDescriptor}',$SubjectDescriptor

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}