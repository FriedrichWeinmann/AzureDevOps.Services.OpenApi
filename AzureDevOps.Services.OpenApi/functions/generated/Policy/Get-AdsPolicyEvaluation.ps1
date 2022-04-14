function Get-AdsPolicyEvaluation {
<#
.SYNOPSIS
    

.DESCRIPTION
    Retrieves a list of all the policy evaluation statuses for a specific pull request.

Evaluations are retrieved using an artifact ID which uniquely identifies the pull request.
To generate an artifact ID for a pull request, use this template:
```
vstfs:///CodeReview/CodeReviewId/{projectId}/{pullRequestId}
```

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Skip
    The number of policy evaluation records to ignore. For example, to retrieve results 101-150, set top to 50 and skip to 100.

.PARAMETER EvaluationId
    ID of the policy evaluation to be retrieved.

.PARAMETER IncludeNotApplicable
    Some policies might determine that they do not apply to a specific pull request. Setting this parameter to true will return evaluation records even for policies which don't apply to this pull request.

.PARAMETER Top
    The number of policy evaluation records to retrieve.

.PARAMETER ArtifactId
    A string which uniquely identifies the target of a policy evaluation.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsPolicyEvaluation -ApiVersion $apiversion -ArtifactId $artifactid -Project $project -Organization $organization

    Retrieves a list of all the policy evaluation statuses for a specific pull request.

Evaluations are retrieved using an artifact ID which uniquely identifies the pull request.
To generate an artifact ID for a pull request, use this template:
```
vstfs:///CodeReview/CodeReviewId/{projectId}/{pullRequestId}
```

.EXAMPLE
    PS C:\> Get-AdsPolicyEvaluation -ApiVersion $apiversion -EvaluationId $evaluationid -Project $project -Organization $organization

    Gets the present evaluation state of a policy.

Each policy which applies to a pull request will have an evaluation state which is specific to that policy running
in the context of that pull request. Each evaluation is uniquely identified via a Guid. You can find all the policy
evaluations for a specific pull request using the List operation of this controller.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Evaluations_Get')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Skip,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Evaluations_Get')]
        [string]
        $EvaluationId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeNotApplicable,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ArtifactId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Evaluations_Get')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Evaluations_Get')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Skip' = '$skip'
            'IncludeNotApplicable' = 'includeNotApplicable'
            'Top' = '$top'
            'ArtifactId' = 'artifactId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Skip','IncludeNotApplicable','Top','ArtifactId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/policy/evaluations' -Replace '{project}',$Project -Replace '{organization}',$Organization
        if ($EvaluationId) { $__path += "/$EvaluationId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}