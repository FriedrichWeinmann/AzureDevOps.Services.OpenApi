function Get-AdsDistributedtaskVariablegroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get variable groups by ids.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER GroupId
    Id of the variable group.

.PARAMETER Project
    Project ID or project name

.PARAMETER GroupIds
    Comma separated list of Ids of variable groups.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskVariablegroup -Organization $organization -ApiVersion $apiversion -GroupId $groupid -Project $project

    Get a variable group.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskVariablegroup -Organization $organization -ApiVersion $apiversion -Project $project -GroupIds $groupids

    Get variable groups by ids.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Variablegroups_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Variablegroups_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Variablegroups_Get')]
        [string]
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Variablegroups_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $GroupIds
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'GroupIds' = 'groupIds'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','GroupIds') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/variablegroups' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($GroupId) { $__path += "/$GroupId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}