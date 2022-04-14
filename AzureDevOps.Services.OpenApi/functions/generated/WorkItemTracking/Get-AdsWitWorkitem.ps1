function Get-AdsWitWorkitem {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of work items (Maximum 200)

.PARAMETER ErrorPolicy
    The flag to control error policy in a bulk get work items request. Possible options are {Fail, Omit}.

.PARAMETER Fields
    Comma-separated list of requested fields

.PARAMETER Expand
    The expand parameters for work item attributes. Possible options are { None, Relations, Fields, Links, All }.

.PARAMETER Id
    The work item id

.PARAMETER AsOf
    AsOf UTC date time string

.PARAMETER Ids
    The comma-separated list of requested work item ids. (Maximum 200 ids allowed).

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitem -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Returns a single work item.

.EXAMPLE
    PS C:\> Get-AdsWitWorkitem -Ids $ids -Project $project -Organization $organization -ApiVersion $apiversion

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
        $Fields,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Id,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $AsOf,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Ids,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Work Items_Get Work Item')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ErrorPolicy' = 'errorPolicy'
            'Fields' = 'fields'
            'Expand' = '$expand'
            'AsOf' = 'asOf'
            'Ids' = 'ids'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ErrorPolicy','Fields','Expand','AsOf','Ids','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/workitems' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($Id) { $__path += "/$Id" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}