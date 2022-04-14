function Get-AdsGraphSubjectAvatar {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SubjectDescriptor
    

.PARAMETER Size
    

.PARAMETER Format
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGraphSubjectAvatar -Organization $organization -SubjectDescriptor $subjectdescriptor -ApiVersion $apiversion

    <insert description here>

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
        $SubjectDescriptor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Size,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Format,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Size' = 'size'
            'Format' = 'format'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Size','Format','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/Subjects/{subjectDescriptor}/avatars' -Replace '{organization}',$Organization -Replace '{subjectDescriptor}',$SubjectDescriptor

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}