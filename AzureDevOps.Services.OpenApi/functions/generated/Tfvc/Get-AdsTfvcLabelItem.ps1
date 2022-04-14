function Get-AdsTfvcLabelItem {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get items under a label.

.PARAMETER Skip
    Number of items to skip

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER LabelId
    Unique identifier of label

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Top
    Max number of items to return

.EXAMPLE
    PS C:\> Get-AdsTfvcLabelItem -ApiVersion $apiversion -LabelId $labelid -Organization $organization

    Get items under a label.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $LabelId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top
    )
    process {
        $__mapping = @{
            'Skip' = '$skip'
            'ApiVersion' = 'api-version'
            'Top' = '$top'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Skip','ApiVersion','Top') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/tfvc/labels/{labelId}/items' -Replace '{labelId}',$LabelId -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}