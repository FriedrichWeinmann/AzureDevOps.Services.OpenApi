function Get-AdsWitWorkitem {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of work items (Maximum 200)

.PARAMETER ErrorPolicy
    The flag to control error policy in a bulk get work items request. Possible options are {Fail, Omit}.

.PARAMETER Expand
    The expand parameters for work item attributes. Possible options are { None, Relations, Fields, Links, All }.

.PARAMETER Ids
    The comma-separated list of requested work item ids. (Maximum 200 ids allowed).

.PARAMETER Fields
    Comma-separated list of requested fields

.PARAMETER AsOf
    AsOf UTC date time string

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Id
    The work item id

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitem -ApiVersion $apiversion -Id $id -Project $project -Organization $organization

    Returns a single work item.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitem -Ids $ids -ApiVersion $apiversion -Project $project -Organization $organization

    Returns a list of work items (Maximum 200)

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ErrorPolicy,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Ids,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Fields,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $AsOf,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ErrorPolicy' = 'errorPolicy'
            'Expand' = '$expand'
            'Ids' = 'ids'
            'Fields' = 'fields'
            'AsOf' = 'asOf'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ErrorPolicy','Expand','Ids','Fields','AsOf','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workitems' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($Id) { $__path += "/$Id" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}