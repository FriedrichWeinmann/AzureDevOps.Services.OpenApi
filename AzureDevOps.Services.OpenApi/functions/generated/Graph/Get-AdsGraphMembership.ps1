function Get-AdsGraphMembership {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all the memberships where this descriptor is a member in the relationship.

The default value for direction is 'up' meaning return all memberships where the subject is a member (e.g. all groups the subject is a member of).
 Alternatively, passing the direction as 'down' will return all memberships where the subject is a container (e.g. all members of the subject group).

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER SubjectDescriptor
    Fetch all direct memberships of this descriptor.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Depth
    The maximum number of edges to traverse up or down the membership tree. Currently the only supported value is '1'.

.PARAMETER Direction
    Defaults to Up.

.EXAMPLE
    PS C:\> Get-AdsGraphMembership -ApiVersion $apiversion -SubjectDescriptor $subjectdescriptor -Organization $organization

    Get all the memberships where this descriptor is a member in the relationship.

The default value for direction is 'up' meaning return all memberships where the subject is a member (e.g. all groups the subject is a member of).
 Alternatively, passing the direction as 'down' will return all memberships where the subject is a container (e.g. all members of the subject group).

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
        $SubjectDescriptor,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Depth,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Direction
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Depth' = 'depth'
            'Direction' = 'direction'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Depth','Direction') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/Memberships/{subjectDescriptor}' -Replace '{subjectDescriptor}',$SubjectDescriptor -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}