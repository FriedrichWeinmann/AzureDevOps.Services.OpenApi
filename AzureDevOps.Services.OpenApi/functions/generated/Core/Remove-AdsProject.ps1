function Remove-AdsProject {
<#
.SYNOPSIS
    

.DESCRIPTION
    Queues a project to be deleted. Use the [GetOperation](../../operations/operations/get) to periodically check for delete project status.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ProjectId
    The project id of the project to delete.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.4' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsProject -Organization $organization -ProjectId $projectid -ApiVersion $apiversion

    Queues a project to be deleted. Use the [GetOperation](../../operations/operations/get) to periodically check for delete project status.

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
        $ProjectId,

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
        $__path = 'https://dev.azure.com/{organization}/_apis/projects/{projectId}' -Replace '{organization}',$Organization -Replace '{projectId}',$ProjectId

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}