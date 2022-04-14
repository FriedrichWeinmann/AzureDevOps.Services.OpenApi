function Get-AdsWorkBoardChartimage {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a board chart image.

.PARAMETER ShowDetails
    Whether or not the chart should include detailed information (e.g. axis labels, titles, trend lines, etc.).

.PARAMETER Title
    The title of the chart. Can only be dislayed if ShowLabels is true.

.PARAMETER Name
    The chart name. e.g. CumulativeFlow.

.PARAMETER Width
    The width of the chart in pixels. Must be greater than 0.

.PARAMETER Height
    The height of the chart in pixels. Must be greater than 0.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Board
    Identifier for board, either board's backlog level name (e.g. "Issues") or Id.

.PARAMETER Project
    Project ID or project name

.PARAMETER Team
    Team ID or team name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWorkBoardChartimage -Name $name -ApiVersion $apiversion -Board $board -Project $project -Team $team -Organization $organization

    Get a board chart image.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ShowDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Title,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Width,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Height,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Board,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ShowDetails' = 'showDetails'
            'Title' = 'title'
            'Width' = 'width'
            'Height' = 'height'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ShowDetails','Title','Width','Height','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards/{board}/chartimages/{name}' -Replace '{name}',$Name -Replace '{board}',$Board -Replace '{project}',$Project -Replace '{team}',$Team -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}