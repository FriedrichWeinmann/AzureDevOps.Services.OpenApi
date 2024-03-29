﻿function Get-AdsSecurityroleScopeRoleassignmentResource {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get role assignments for the resource

.PARAMETER ResourceId
    Id of the resource that is assigned the scope

.PARAMETER ScopeId
    Id of the assigned scope

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsSecurityroleScopeRoleassignmentResource -ResourceId $resourceid -ScopeId $scopeid -Organization $organization -ApiVersion $apiversion

    Get role assignments for the resource

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResourceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopeId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/securityroles/scopes/{scopeId}/roleassignments/resources/{resourceId}' -Replace '{resourceId}',$ResourceId -Replace '{scopeId}',$ScopeId -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}