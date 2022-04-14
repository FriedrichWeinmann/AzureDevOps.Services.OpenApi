function Remove-AdsDistributedtaskVariablegroup {
<#
.SYNOPSIS
    

.DESCRIPTION
    Delete a variable group

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER GroupId
    Id of the variable group.

.PARAMETER ProjectIds
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsDistributedtaskVariablegroup -Organization $organization -GroupId $groupid -ProjectIds $projectids -ApiVersion $apiversion

    Delete a variable group

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
        $GroupId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ProjectIds,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ProjectIds' = 'projectIds'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ProjectIds','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/variablegroups/{groupId}' -Replace '{organization}',$Organization -Replace '{groupId}',$GroupId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}