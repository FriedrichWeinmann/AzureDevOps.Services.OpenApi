function Get-AdsWorkBoardBoardparent {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns the list of parent field filter model for the given list of workitem ids

.PARAMETER ChildBacklogContextCategoryRefName
    

.PARAMETER WorkitemIds
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Team
    Team ID or team name

.EXAMPLE
    PS C:\> Get-AdsWorkBoardBoardparent -ChildBacklogContextCategoryRefName $childbacklogcontextcategoryrefname -WorkitemIds $workitemids -Project $project -Organization $organization -ApiVersion $apiversion -Team $team

    Returns the list of parent field filter model for the given list of workitem ids

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ChildBacklogContextCategoryRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $WorkitemIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team
    )
    process {
        $__mapping = @{
            'ChildBacklogContextCategoryRefName' = 'childBacklogContextCategoryRefName'
            'WorkitemIds' = 'workitemIds'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ChildBacklogContextCategoryRefName','WorkitemIds','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards/boardparents' -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{team}',$Team

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}