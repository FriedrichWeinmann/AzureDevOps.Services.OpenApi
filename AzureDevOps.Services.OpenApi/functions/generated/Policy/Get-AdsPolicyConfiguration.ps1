function Get-AdsPolicyConfiguration {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of policy configurations in a project.

The 'scope' parameter for this API should not be used, except for legacy compatability reasons. It returns specifically
scoped policies and does not support heirarchical nesting. Instead, use the /_apis/git/policy/configurations API, which provides
first class scope filtering support.

The optional `policyType` parameter can be used to filter the set of policies returned from this method.

.PARAMETER ContinuationToken
    The continuation token used for pagination.

.PARAMETER ConfigurationId
    ID of the policy configuration

.PARAMETER Scope
    [Provided for legacy reasons] The scope on which a subset of policies is defined.

.PARAMETER PolicyType
    Filter returned policies to only this type

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Top
    Maximum number of policies to return.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPolicyConfiguration -ApiVersion $apiversion -Project $project -Organization $organization

    Get a list of policy configurations in a project.

The 'scope' parameter for this API should not be used, except for legacy compatability reasons. It returns specifically
scoped policies and does not support heirarchical nesting. Instead, use the /_apis/git/policy/configurations API, which provides
first class scope filtering support.

The optional `policyType` parameter can be used to filter the set of policies returned from this method.

.EXAMPLE
    PS C:\> Get-AdsPolicyConfiguration -ConfigurationId $configurationid -ApiVersion $apiversion -Project $project -Organization $organization

    Get a policy configuration by its ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Configurations_Get')]
        [string]
        $ConfigurationId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Scope,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PolicyType,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Configurations_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Configurations_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Configurations_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Scope' = 'scope'
            'PolicyType' = 'policyType'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Scope','PolicyType','ApiVersion','Top') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/policy/configurations' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($ConfigurationId) { $__path += "/$ConfigurationId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}