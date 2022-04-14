function Set-AdsGroupentitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Update entitlements (License Rule, Extensions Rule, Project memberships etc.) for a group.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER GroupId
    ID of the group.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RuleOption
    RuleOption [ApplyGroupRule/TestApplyGroupRule] - specifies if the rules defined in group entitlement should be updated and the changes are applied to it’s members (default option) or just be tested

.EXAMPLE
    PS C:\> Set-AdsGroupentitlement -ApiVersion $apiversion -GroupId $groupid -Organization $organization

    Update entitlements (License Rule, Extensions Rule, Project memberships etc.) for a group.

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
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RuleOption
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RuleOption' = 'ruleOption'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RuleOption') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/groupentitlements/{groupId}' -Replace '{groupId}',$GroupId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}