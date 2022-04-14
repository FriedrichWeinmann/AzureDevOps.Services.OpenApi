function Remove-AdsGroupentitlement {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a group entitlement.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER GroupId
    ID of the group to delete.

.PARAMETER RemoveGroupMembership
    Optional parameter that specifies whether the group with the given ID should be removed from all other groups

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER RuleOption
    RuleOption [ApplyGroupRule/TestApplyGroupRule] - specifies if the rules defined in group entitlement should be deleted and the changes are applied to it’s members (default option) or just be tested

.EXAMPLE
    PS C:\> Remove-AdsGroupentitlement -ApiVersion $apiversion -GroupId $groupid -Organization $organization

    Delete a group entitlement.

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

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $RemoveGroupMembership,

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
            'RemoveGroupMembership' = 'removeGroupMembership'
            'RuleOption' = 'ruleOption'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','RemoveGroupMembership','RuleOption') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsaex.dev.azure.com/{organization}/_apis/groupentitlements/{groupId}' -Replace '{groupId}',$GroupId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}