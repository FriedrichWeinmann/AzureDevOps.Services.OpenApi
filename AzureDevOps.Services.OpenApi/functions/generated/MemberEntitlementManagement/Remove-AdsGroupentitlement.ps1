function Remove-AdsGroupEntitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a group entitlement.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER GroupId
    ID of the group to delete.

.PARAMETER RuleOption
    RuleOption [ApplyGroupRule/TestApplyGroupRule] - specifies if the rules defined in group entitlement should be deleted and the changes are applied to it’s members (default option) or just be tested

.PARAMETER RemoveGroupMembership
    Optional parameter that specifies whether the group with the given ID should be removed from all other groups

.EXAMPLE
    PS C:\> Remove-AdsGroupEntitlement -Organization $organization -ApiVersion $apiversion -GroupId $groupid

    Delete a group entitlement.

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $RuleOption,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $RemoveGroupMembership
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'RuleOption' = 'ruleOption'
            'RemoveGroupMembership' = 'removeGroupMembership'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RuleOption','RemoveGroupMembership') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/groupentitlements/{groupId}' -Replace '{organization}',$Organization -Replace '{groupId}',$GroupId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}