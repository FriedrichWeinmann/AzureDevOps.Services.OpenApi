function Get-AdsProject {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all projects in the organization that the authenticated user has access to.

.PARAMETER ContinuationToken
    

.PARAMETER Skip
    

.PARAMETER IncludeHistory
    Search within renamed projects (that had such name in the past).

.PARAMETER GetDefaultTeamImageUrl
    

.PARAMETER ProjectId
    

.PARAMETER IncludeCapabilities
    Include capabilities (such as source control) in the team project result (default: false).

.PARAMETER Top
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.PARAMETER StateFilter
    Filter on team projects in a specific team project state (default: WellFormed).

.EXAMPLE
    PS C:\> Get-AdsProject -ProjectId $projectid -Organization $organization -ApiVersion $apiversion

    Get project with the specified id or name, optionally including capabilities.

.EXAMPLE
    PS C:\> Get-AdsProject -Organization $organization -ApiVersion $apiversion

    Get all projects in the organization that the authenticated user has access to.

.LINK
    https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/list
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Projects_Get')]
        [boolean]
        $IncludeHistory,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $GetDefaultTeamImageUrl,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Projects_Get')]
        [string]
        $ProjectId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Projects_Get')]
        [boolean]
        $IncludeCapabilities,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Projects_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Projects_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StateFilter
    )
    process {
        $__mapping = @{
            'ContinuationToken' = 'continuationToken'
            'Skip' = '$skip'
            'IncludeHistory' = 'includeHistory'
            'GetDefaultTeamImageUrl' = 'getDefaultTeamImageUrl'
            'IncludeCapabilities' = 'includeCapabilities'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
            'StateFilter' = 'stateFilter'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContinuationToken','Skip','IncludeHistory','GetDefaultTeamImageUrl','IncludeCapabilities','Top','ApiVersion','StateFilter') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/projects' -Replace '{organization}',$Organization
        if ($ProjectId) { $__path += "/$ProjectId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}