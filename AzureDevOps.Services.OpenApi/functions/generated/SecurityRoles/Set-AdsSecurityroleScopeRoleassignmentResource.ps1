﻿function Set-AdsSecurityroleScopeRoleassignmentResource {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ResourceId
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ScopeId
    

.EXAMPLE
    PS C:\> Set-AdsSecurityroleScopeRoleassignmentResource -ApiVersion $apiversion -ResourceId $resourceid -Organization $organization -ScopeId $scopeid

    <insert description here>

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
        $ResourceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopeId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/securityroles/scopes/{scopeId}/roleassignments/resources/{resourceId}' -Replace '{resourceId}',$ResourceId -Replace '{organization}',$Organization -Replace '{scopeId}',$ScopeId
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}