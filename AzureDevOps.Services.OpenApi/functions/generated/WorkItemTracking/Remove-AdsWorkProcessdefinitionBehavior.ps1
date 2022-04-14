function Remove-AdsWorkProcessdefinitionBehavior {
<#
.SYNOPSIS
    

.DESCRIPTION
    Removes a behavior in the process.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProcessId
    The ID of the process

.PARAMETER BehaviorId
    The ID of the behavior

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '4.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsWorkProcessdefinitionBehavior -Organization $organization -ProcessId $processid -BehaviorId $behaviorid -ApiVersion $apiversion

    Removes a behavior in the process.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProcessId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BehaviorId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
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
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processdefinitions/{processId}/behaviors/{behaviorId}' -Replace '{organization}',$Organization -Replace '{processId}',$ProcessId -Replace '{behaviorId}',$BehaviorId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}