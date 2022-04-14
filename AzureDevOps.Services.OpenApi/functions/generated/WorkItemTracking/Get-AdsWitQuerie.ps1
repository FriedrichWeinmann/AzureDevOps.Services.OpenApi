function Get-AdsWitQuerie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets the root queries and their children

.PARAMETER IncludeDeleted
    Include deleted queries and folders

.PARAMETER Expand
    Include the query string (wiql), clauses, query result columns, and sort options in the results.

.PARAMETER Depth
    In the folder of queries, return child queries and folders to this depth.

.PARAMETER Query
    ID or path of the query.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER UseIsoDateFormat
    DateTime query clauses will be formatted using a ISO 8601 compliant format

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWitQuerie -ApiVersion $apiversion -Project $project -Organization $organization

    Gets the root queries and their children

.EXAMPLE
    PS C:\> Get-AdsWitQuerie -Query $query -ApiVersion $apiversion -Project $project -Organization $organization

    Retrieves an individual query and its children

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [boolean]
        $IncludeDeleted,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [string]
        $Expand,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [int32]
        $Depth,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [string]
        $Query,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [boolean]
        $UseIsoDateFormat,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Queries_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeDeleted' = '$includeDeleted'
            'Expand' = '$expand'
            'Depth' = '$depth'
            'ApiVersion' = 'api-version'
            'UseIsoDateFormat' = '$useIsoDateFormat'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeDeleted','Expand','Depth','ApiVersion','UseIsoDateFormat') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/queries' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($Query) { $__path += "/$Query" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}