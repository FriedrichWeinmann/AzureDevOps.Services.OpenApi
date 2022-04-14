function Get-AdsTfvcLabel {
<#
.SYNOPSIS
    Get a collection of shallow label references.

.DESCRIPTION
    Get a collection of shallow label references.

.PARAMETER MaxItemCount
    labelScope, name, owner, and itemLabelFilter

.PARAMETER Owner
    labelScope, name, owner, and itemLabelFilter

.PARAMETER ItemLabelFilter
    labelScope, name, owner, and itemLabelFilter

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Skip
    Number of labels to skip

.PARAMETER Name
    labelScope, name, owner, and itemLabelFilter

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references

.PARAMETER Top
    Max number of labels to return, defaults to 100 when undefined

.PARAMETER LabelScope
    labelScope, name, owner, and itemLabelFilter

.PARAMETER Project
    Project ID or project name

.PARAMETER LabelId
    Unique identifier of label

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsTfvcLabel -ApiVersion $apiversion -Project $project -Organization $organization

    Get a collection of shallow label references.

.EXAMPLE
    PS C:\> Get-AdsTfvcLabel -ApiVersion $apiversion -Project $project -LabelId $labelid -Organization $organization

    Get a single deep label.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [int32]
        $MaxItemCount,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Owner,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $ItemLabelFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

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
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $LabelScope,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $LabelId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Labels_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'MaxItemCount' = 'requestData.maxItemCount'
            'Owner' = 'requestData.owner'
            'ItemLabelFilter' = 'requestData.itemLabelFilter'
            'ApiVersion' = 'api-version'
            'Skip' = '$skip'
            'Name' = 'requestData.name'
            'IncludeLinks' = 'requestData.includeLinks'
            'Top' = '$top'
            'LabelScope' = 'requestData.labelScope'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('MaxItemCount','Owner','ItemLabelFilter','ApiVersion','Skip','Name','IncludeLinks','Top','LabelScope') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/labels' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($LabelId) { $__path += "/$LabelId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}