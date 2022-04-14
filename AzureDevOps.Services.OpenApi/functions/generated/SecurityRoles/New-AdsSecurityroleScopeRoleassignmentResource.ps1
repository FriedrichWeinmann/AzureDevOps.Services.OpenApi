function New-AdsSecurityroleScopeRoleassignmentResource {
<#
.SYNOPSIS
    

.DESCRIPTION
    Set role assignment on a resource

.PARAMETER ResourceId
    Id of the resource on which the role is to be assigned

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER ScopeId
    Id of the assigned scope

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IdentityId
    

.EXAMPLE
    PS C:\> New-AdsSecurityroleScopeRoleassignmentResource -ResourceId $resourceid -ApiVersion $apiversion -ScopeId $scopeid -Organization $organization -IdentityId $identityid

    Set role assignment on a resource

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ResourceId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopeId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $IdentityId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/securityroles/scopes/{scopeId}/roleassignments/resources/{resourceId}/{identityId}' -Replace '{resourceId}',$ResourceId -Replace '{scopeId}',$ScopeId -Replace '{organization}',$Organization -Replace '{identityId}',$IdentityId

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}