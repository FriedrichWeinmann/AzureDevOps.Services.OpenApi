function Get-AdsReleaseDeployment {
<#
.SYNOPSIS
    

.DESCRIPTION
    

.PARAMETER OperationStatus
    

.PARAMETER MaxStartedTime
    

.PARAMETER DefinitionId
    

.PARAMETER ContinuationToken
    

.PARAMETER LatestAttemptsOnly
    

.PARAMETER Project
    Project ID or project name

.PARAMETER MinModifiedTime
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER QueryOrder
    

.PARAMETER CreatedFor
    

.PARAMETER MinStartedTime
    

.PARAMETER SourceBranch
    

.PARAMETER DeploymentStatus
    

.PARAMETER Top
    

.PARAMETER DefinitionEnvironmentId
    

.PARAMETER CreatedBy
    

.PARAMETER MaxModifiedTime
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsReleaseDeployment -ApiVersion $apiversion -Project $project -Organization $organization

    <insert description here>

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $OperationStatus,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxStartedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $LatestAttemptsOnly,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinModifiedTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatedFor,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MinStartedTime,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $SourceBranch,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DeploymentStatus,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $DefinitionEnvironmentId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $CreatedBy,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $MaxModifiedTime,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'OperationStatus' = 'operationStatus'
            'CreatedBy' = 'createdBy'
            'DefinitionEnvironmentId' = 'definitionEnvironmentId'
            'Top' = '$top'
            'DeploymentStatus' = 'deploymentStatus'
            'SourceBranch' = 'sourceBranch'
            'MinStartedTime' = 'minStartedTime'
            'CreatedFor' = 'createdFor'
            'QueryOrder' = 'queryOrder'
            'ApiVersion' = 'api-version'
            'MinModifiedTime' = 'minModifiedTime'
            'LatestAttemptsOnly' = 'latestAttemptsOnly'
            'ContinuationToken' = 'continuationToken'
            'DefinitionId' = 'definitionId'
            'MaxStartedTime' = 'maxStartedTime'
            'MaxModifiedTime' = 'maxModifiedTime'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('OperationStatus','CreatedBy','DefinitionEnvironmentId','Top','DeploymentStatus','SourceBranch','MinStartedTime','CreatedFor','QueryOrder','ApiVersion','MinModifiedTime','LatestAttemptsOnly','ContinuationToken','DefinitionId','MaxStartedTime','MaxModifiedTime') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/deployments' -Replace '{project}',$Project -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}