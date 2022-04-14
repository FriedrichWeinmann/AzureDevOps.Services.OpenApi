function Get-AdsTfvcLabel {
<#
.SYNOPSIS
    Get a collection of shallow label references.

.DESCRIPTION
    Get a collection of shallow label references.

.PARAMETER Name
    labelScope, name, owner, and itemLabelFilter

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER Skip
    Number of labels to skip

.PARAMETER Owner
    labelScope, name, owner, and itemLabelFilter

.PARAMETER LabelScope
    labelScope, name, owner, and itemLabelFilter

.PARAMETER ItemLabelFilter
    labelScope, name, owner, and itemLabelFilter

.PARAMETER Top
    Max number of labels to return, defaults to 100 when undefined

.PARAMETER Project
    Project ID or project name

.PARAMETER MaxItemCount
    labelScope, name, owner, and itemLabelFilter

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER LabelId
    Unique identifier of label

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsTfvcLabel -Project $project -Organization $organization -LabelId $labelid -ApiVersion $apiversion

    Get a single deep label.

.EXAMPLE
    PS C:\> Get-AdsTfvcLabel -Project $project -Organization $organization -ApiVersion $apiversion

    Get a collection of shallow label references.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Owner,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $LabelScope,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $ItemLabelFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [int32]
        $MaxItemCount,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $LabelId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Name' = 'requestData.name'
            'IncludeLinks' = 'requestData.includeLinks'
            'Skip' = '$skip'
            'Owner' = 'requestData.owner'
            'LabelScope' = 'requestData.labelScope'
            'ItemLabelFilter' = 'requestData.itemLabelFilter'
            'Top' = '$top'
            'MaxItemCount' = 'requestData.maxItemCount'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Name','IncludeLinks','Skip','Owner','LabelScope','ItemLabelFilter','Top','MaxItemCount','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/labels' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($LabelId) { $__path += "/$LabelId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}