function Get-AdsDistributedtaskEnvironment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get all environments.

.PARAMETER Expands
    Include these additional details in the returned objects.

.PARAMETER ContinuationToken
    

.PARAMETER Name
    

.PARAMETER Top
    

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER EnvironmentId
    ID of the environment.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskEnvironment -Project $project -Organization $organization -ApiVersion $apiversion -EnvironmentId $environmentid

    Get an environment by its ID.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskEnvironment -Project $project -Organization $organization -ApiVersion $apiversion

    Get all environments.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Environments_Get')]
        [string]
        $Expands,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Environments_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Environments_Get')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Environments_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Environments_Get')]
        [string]
        $EnvironmentId
    )
    process {
        $__mapping = @{
            'Expands' = 'expands'
            'ContinuationToken' = 'continuationToken'
            'Name' = 'name'
            'Top' = '$top'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Expands','ContinuationToken','Name','Top','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/distributedtask/environments' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($EnvironmentId) { $__path += "/$EnvironmentId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}