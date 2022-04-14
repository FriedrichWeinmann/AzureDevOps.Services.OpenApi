function Invoke-AdsGraphMembership {
<#
.SYNOPSIS
    

.DESCRIPTION
    Check to see if a membership relationship between a container and subject exists.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER SubjectDescriptor
    The group or user that is a child subject of the relationship.

.PARAMETER ContainerDescriptor
    The group that is the container in the relationship.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Invoke-AdsGraphMembership -ApiVersion $apiversion -SubjectDescriptor $subjectdescriptor -ContainerDescriptor $containerdescriptor -Organization $organization

    Check to see if a membership relationship between a container and subject exists.

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
        $ContainerDescriptor,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/memberships/{subjectDescriptor}/{containerDescriptor}' -Replace '{subjectDescriptor}',$SubjectDescriptor -Replace '{containerDescriptor}',$ContainerDescriptor -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method head -Body $__body -Query $__query -Header $__header
    }
}