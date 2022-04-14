function Get-AdsWorkProcesse {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get list of all processes including system and inherited.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER Expand
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProcessTypeId
    

.EXAMPLE
    PS C:\> Get-AdsWorkProcesse -ApiVersion $apiversion -Organization $organization -ProcessTypeId $processtypeid

    Get a single process of a specified ID.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesse -ApiVersion $apiversion -Organization $organization

    Get list of all processes including system and inherited.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Processes_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Processes_Get')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Processes_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Processes_Get')]
        [string]
        $ProcessTypeId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Expand' = '$expand'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Expand') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes' -Replace '{organization}',$Organization
        if ($ProcessTypeId) { $__path += "/$ProcessTypeId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}