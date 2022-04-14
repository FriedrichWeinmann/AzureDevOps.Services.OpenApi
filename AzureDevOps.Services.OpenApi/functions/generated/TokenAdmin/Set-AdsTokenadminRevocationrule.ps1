function Set-AdsTokenadminRevocationrule {
<#
.SYNOPSIS
    

.DESCRIPTION
    Creates a revocation rule to prevent the further usage of any OAuth authorizations that were created before the current point in time and which match the conditions in the rule.

Not all kinds of OAuth authorizations can be revoked directly.
Some, such as self-describing session tokens, must instead by revoked by creating a rule
which will be evaluated and used to reject matching OAuth credentials at authentication time.
Revocation rules created through this endpoint will apply to all credentials that were issued
before the datetime at which the rule was created and which match one or more additional conditions.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Set-AdsTokenadminRevocationrule -ApiVersion $apiversion -Organization $organization

    Creates a revocation rule to prevent the further usage of any OAuth authorizations that were created before the current point in time and which match the conditions in the rule.

Not all kinds of OAuth authorizations can be revoked directly.
Some, such as self-describing session tokens, must instead by revoked by creating a rule
which will be evaluated and used to reject matching OAuth credentials at authentication time.
Revocation rules created through this endpoint will apply to all credentials that were issued
before the datetime at which the rule was created and which match one or more additional conditions.

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
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vssps.dev.azure.com/{organization}/_apis/tokenadmin/revocationrules' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}