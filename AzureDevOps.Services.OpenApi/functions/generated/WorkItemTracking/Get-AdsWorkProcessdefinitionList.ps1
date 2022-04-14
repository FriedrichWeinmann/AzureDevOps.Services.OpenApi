function Get-AdsWorkProcessdefinitionList {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns meta data of the picklist.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ListId
    The ID of the list

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsWorkProcessdefinitionList -Organization $organization -ListId $listid -ApiVersion $apiversion

    Returns a picklist.

.EXAMPLE
    PS C:\> Get-AdsWorkProcessdefinitionList -Organization $organization -ApiVersion $apiversion

    Returns meta data of the picklist.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $ListId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/lists' -Replace '{organization}',$Organization
        if ($ListId) { $__path += "/$ListId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}