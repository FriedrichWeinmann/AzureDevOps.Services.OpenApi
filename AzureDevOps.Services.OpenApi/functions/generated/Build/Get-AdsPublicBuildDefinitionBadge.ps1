function Get-AdsPublicBuildDefinitionBadge {
<#
.SYNOPSIS
    

.DESCRIPTION
    This endpoint is deprecated. Please see the Build Status REST endpoint.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER BranchName
    The name of the branch.

.PARAMETER Project
    The project ID or name.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsPublicBuildDefinitionBadge -Organization $organization -DefinitionId $definitionid -Project $project -ApiVersion $apiversion

    This endpoint is deprecated. Please see the Build Status REST endpoint.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BranchName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'BranchName' = 'branchName'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('BranchName','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/public/build/definitions/{project}/{definitionId}/badge' -Replace '{organization}',$Organization -Replace '{definitionId}',$DefinitionId -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}