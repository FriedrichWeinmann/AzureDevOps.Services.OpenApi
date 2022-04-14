function Get-AdsPolicyConfigurationRevision {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieve all revisions for a given policy.

.PARAMETER RevisionId
    The revision ID.

.PARAMETER Skip
    The number of revisions to ignore. For example, to retrieve results 101-150, set top to 50 and skip to 100.

.PARAMETER ConfigurationId
    The policy configuration ID.

.PARAMETER Top
    The number of revisions to retrieve.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsPolicyConfigurationRevision -RevisionId $revisionid -ConfigurationId $configurationid -Project $project -Organization $organization -ApiVersion $apiversion

    Retrieve a specific revision of a given policy by ID.

.EXAMPLE
    PS C:\> Get-AdsPolicyConfigurationRevision -ConfigurationId $configurationid -Project $project -Organization $organization -ApiVersion $apiversion

    Retrieve all revisions for a given policy.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $RevisionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $ConfigurationId,

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
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Revisions_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/policy/configurations/{configurationId}/revisions' -Replace '{configurationId}',$ConfigurationId -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($RevisionId) { $__path += "/$RevisionId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}