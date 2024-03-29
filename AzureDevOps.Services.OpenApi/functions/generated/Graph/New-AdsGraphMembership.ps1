﻿function New-AdsGraphMembership {
<#
.SYNOPSIS
    

.DESCRIPTION
    Create a new membership between a container and subject.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SubjectDescriptor
    A descriptor to a group or user that can be the child subject in the relationship.

.PARAMETER ContainerDescriptor
    A descriptor to a group that can be the container in the relationship.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> New-AdsGraphMembership -Organization $organization -SubjectDescriptor $subjectdescriptor -ContainerDescriptor $containerdescriptor -ApiVersion $apiversion

    Create a new membership between a container and subject.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
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
        $ContainerDescriptor,

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
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/graph/memberships/{subjectDescriptor}/{containerDescriptor}' -Replace '{organization}',$Organization -Replace '{subjectDescriptor}',$SubjectDescriptor -Replace '{containerDescriptor}',$ContainerDescriptor

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}