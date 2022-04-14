function Set-AdsGroupEntitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update entitlements (License Rule, Extensions Rule, Project memberships etc.) for a group.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER GroupId
    ID of the group.

.PARAMETER RuleOption
    RuleOption [ApplyGroupRule/TestApplyGroupRule] - specifies if the rules defined in group entitlement should be updated and the changes are applied to it’s members (default option) or just be tested

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsGroupEntitlement -Organization $organization -GroupId $groupid -ApiVersion $apiversion

    Update entitlements (License Rule, Extensions Rule, Project memberships etc.) for a group.

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
        $GroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RuleOption,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'RuleOption' = 'ruleOption'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('RuleOption','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/groupentitlements/{groupId}' -Replace '{organization}',$Organization -Replace '{groupId}',$GroupId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}