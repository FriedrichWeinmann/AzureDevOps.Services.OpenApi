function New-AdsSecurityroleScopeRoleassignmentResource {
<#
.SYNOPSIS
    

.DESCRIPTION
    Set role assignments on a resource

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER LimitToCallerIdentityDomain
    

.PARAMETER ResourceId
    Id of the resource on which the role is to be assigned

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ScopeId
    Id of the assigned scope

.EXAMPLE
    PS C:\> New-AdsSecurityroleScopeRoleassignmentResource -ApiVersion $apiversion -ResourceId $resourceid -Organization $organization -ScopeId $scopeid

    Set role assignments on a resource

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LimitToCallerIdentityDomain,

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
            'LimitToCallerIdentityDomain' = 'limitToCallerIdentityDomain'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','LimitToCallerIdentityDomain') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/securityroles/scopes/{scopeId}/roleassignments/resources/{resourceId}' -Replace '{resourceId}',$ResourceId -Replace '{organization}',$Organization -Replace '{scopeId}',$ScopeId
        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}