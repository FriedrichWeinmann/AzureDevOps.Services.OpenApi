function Set-AdsPolicyEvaluation {
<#
.SYNOPSIS
    

.DESCRIPTION
    Requeue the policy evaluation.

Some policies define a "requeue" action which performs some policy-specific operation.
You can trigger this operation by updating an existing policy evaluation and setting the
PolicyEvaluationRecord.Status field to Queued.
Although any policy evaluation can be requeued, at present only build policies perform any action
in response. Requeueing a build policy will queue a new build to run (cancelling any existing build which
is running).

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Project
    Project ID or project name

.PARAMETER EvaluationId
    ID of the policy evaluation to be retrieved.

.EXAMPLE
    PS C:\> Set-AdsPolicyEvaluation -Organization $organization -ApiVersion $apiversion -Project $project -EvaluationId $evaluationid

    Requeue the policy evaluation.

Some policies define a "requeue" action which performs some policy-specific operation.
You can trigger this operation by updating an existing policy evaluation and setting the
PolicyEvaluationRecord.Status field to Queued.
Although any policy evaluation can be requeued, at present only build policies perform any action
in response. Requeueing a build policy will queue a new build to run (cancelling any existing build which
is running).

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
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $EvaluationId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/policy/evaluations/{evaluationId}' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{evaluationId}',$EvaluationId

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}