function Get-AdsWorkProcesseBehavior {
<#
.SYNOPSIS
    

.DESCRIPTION
    Returns a list of all behaviors in the process.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER ProcessId
    The ID of the process

.PARAMETER Expand
    

.PARAMETER BehaviorRefName
    The reference name of the behavior

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseBehavior -ApiVersion $apiversion -ProcessId $processid -BehaviorRefName $behaviorrefname -Organization $organization

    Returns a behavior of the process.

.EXAMPLE
    PS C:\> Get-AdsWorkProcesseBehavior -ApiVersion $apiversion -ProcessId $processid -Organization $organization

    Returns a list of all behaviors in the process.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Behaviors_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Behaviors_Get')]
        [string]
        $ProcessId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Behaviors_Get')]
        [string]
        $Expand,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Behaviors_Get')]
        [string]
        $BehaviorRefName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Behaviors_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Expand' = '$expand'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Expand') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/work/processes/{processId}/behaviors' -Replace '{processId}',$ProcessId -Replace '{organization}',$Organization
        if ($BehaviorRefName) { $__path += "/$BehaviorRefName" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}