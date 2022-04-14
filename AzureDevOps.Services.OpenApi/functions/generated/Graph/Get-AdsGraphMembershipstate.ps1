function Get-AdsGraphMembershipstate {
<#
.SYNOPSIS
    

.DESCRIPTION
    Check whether a subject is active or inactive.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SubjectDescriptor
    Descriptor of the subject (user, group, scope, etc.) to check state of

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsGraphMembershipstate -Organization $organization -SubjectDescriptor $subjectdescriptor -ApiVersion $apiversion

    Check whether a subject is active or inactive.

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

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/membershipstates/{subjectDescriptor}' -Replace '{organization}',$Organization -Replace '{subjectDescriptor}',$SubjectDescriptor

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}