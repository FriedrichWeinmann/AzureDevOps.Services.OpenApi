function Get-AdsPolicyConfigurationRevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve all revisions for a given policy.

.PARAMETER Skip
    The number of revisions to ignore. For example, to retrieve results 101-150, set top to 50 and skip to 100.

.PARAMETER ConfigurationId
    The policy configuration ID.

.PARAMETER RevisionId
    The revision ID.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Top
    The number of revisions to retrieve.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPolicyConfigurationRevision -ConfigurationId $configurationid -ApiVersion $apiversion -Project $project -Organization $organization

    Retrieve all revisions for a given policy.

.EXAMPLE
    PS C:\> Get-AdsPolicyConfigurationRevision -ConfigurationId $configurationid -RevisionId $revisionid -ApiVersion $apiversion -Project $project -Organization $organization

    Retrieve a specific revision of a given policy by ID.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $ConfigurationId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $RevisionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','ApiVersion','Top') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/policy/configurations/{configurationId}/revisions' -Replace '{configurationId}',$ConfigurationId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($RevisionId) { $__path += "/$RevisionId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}