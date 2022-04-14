function Get-AdsReleaseDeployment {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER CreatedBy
    

.PARAMETER DefinitionEnvironmentId
    

.PARAMETER QueryOrder
    

.PARAMETER Top
    

.PARAMETER Project
    Project ID or project name

.PARAMETER SourceBranch
    

.PARAMETER DeploymentStatus
    

.PARAMETER CreatedFor
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER DefinitionId
    

.PARAMETER MaxModifiedTime
    

.PARAMETER MinModifiedTime
    

.PARAMETER ContinuationToken
    

.PARAMETER OperationStatus
    

.PARAMETER MinStartedTime
    

.PARAMETER LatestAttemptsOnly
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER MaxStartedTime
    

.EXAMPLE
    PS C:\> Get-AdsReleaseDeployment -Organization $organization -Project $project -ApiVersion $apiversion

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatedBy,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionEnvironmentId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceBranch,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DeploymentStatus,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatedFor,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxModifiedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinModifiedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OperationStatus,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinStartedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LatestAttemptsOnly,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxStartedTime
    )
    process {
        $__mapping = @{
            'CreatedBy' = 'createdBy'
            'LatestAttemptsOnly' = 'latestAttemptsOnly'
            'MinStartedTime' = 'minStartedTime'
            'OperationStatus' = 'operationStatus'
            'ContinuationToken' = 'continuationToken'
            'MinModifiedTime' = 'minModifiedTime'
            'MaxModifiedTime' = 'maxModifiedTime'
            'DefinitionId' = 'definitionId'
            'CreatedFor' = 'createdFor'
            'DeploymentStatus' = 'deploymentStatus'
            'SourceBranch' = 'sourceBranch'
            'Top' = '$top'
            'QueryOrder' = 'queryOrder'
            'DefinitionEnvironmentId' = 'definitionEnvironmentId'
            'ApiVersion' = 'api-version'
            'MaxStartedTime' = 'maxStartedTime'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('CreatedBy','LatestAttemptsOnly','MinStartedTime','OperationStatus','ContinuationToken','MinModifiedTime','MaxModifiedTime','DefinitionId','CreatedFor','DeploymentStatus','SourceBranch','Top','QueryOrder','DefinitionEnvironmentId','ApiVersion','MaxStartedTime') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/deployments' -Replace '{organization}',$Organization -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}