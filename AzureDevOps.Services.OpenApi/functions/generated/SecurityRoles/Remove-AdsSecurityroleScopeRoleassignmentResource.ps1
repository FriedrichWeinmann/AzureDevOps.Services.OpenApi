function Remove-AdsSecurityroleScopeRoleassignmentResource {
<#
.SYNOPSIS
    

.DESCRIPTION
    Remove the role assignment on a resource

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ResourceId
    Id of the resource on which the role is to be removed

.PARAMETER IdentityId
    Identity on which the assignment is to be removed

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ScopeId
    Id of the assigned scope

.EXAMPLE
    PS C:\> Remove-AdsSecurityroleScopeRoleassignmentResource -ApiVersion $apiversion -ResourceId $resourceid -IdentityId $identityid -Organization $organization -ScopeId $scopeid

    Remove the role assignment on a resource

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
        $IdentityId,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/securityroles/scopes/{scopeId}/roleassignments/resources/{resourceId}/{identityId}' -Replace '{resourceId}',$ResourceId -Replace '{identityId}',$IdentityId -Replace '{organization}',$Organization -Replace '{scopeId}',$ScopeId
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}