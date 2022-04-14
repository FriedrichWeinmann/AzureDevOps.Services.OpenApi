function Get-AdsWorkBoardChartimage {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a board chart image.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Height
    The height of the chart in pixels. Must be greater than 0.

.PARAMETER Width
    The width of the chart in pixels. Must be greater than 0.

.PARAMETER Name
    The chart name. e.g. CumulativeFlow.

.PARAMETER Board
    Identifier for board, either board's backlog level name (e.g. "Issues") or Id.

.PARAMETER Project
    Project ID or project name

.PARAMETER Title
    The title of the chart. Can only be dislayed if ShowLabels is true.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ShowDetails
    Whether or not the chart should include detailed information (e.g. axis labels, titles, trend lines, etc.).

.PARAMETER Team
    Team ID or team name

.EXAMPLE
    PS C:\> Get-AdsWorkBoardChartimage -ApiVersion $apiversion -Name $name -Board $board -Project $project -Organization $organization -Team $team

    Get a board chart image.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Height,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Width,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Board,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Title,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $ShowDetails,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Team
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Height' = 'height'
            'Width' = 'width'
            'Title' = 'title'
            'ShowDetails' = 'showDetails'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Height','Width','Title','ShowDetails') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards/{board}/chartimages/{name}' -Replace '{name}',$Name -Replace '{board}',$Board -Replace '{project}',$Project -Replace '{organization}',$Organization -Replace '{team}',$Team

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}