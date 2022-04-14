function Get-AdsReleaseApproval {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of approvals

.PARAMETER QueryOrder
    Gets the results in the defined order of created approvals. Default is 'descending'.

.PARAMETER ContinuationToken
    Gets the approvals after the continuation token provided.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER ReleaseIdsFilter
    Approvals for release id(s) mentioned in the filter. Multiple releases can be mentioned by separating them with ',' e.g. releaseIdsFilter=1,2,3,4.

.PARAMETER StatusFilter
    Approvals with this status. Default is 'pending'.

.PARAMETER IncludeMyGroupApprovals
    'true' to include my group approvals. Default is 'false'.

.PARAMETER TypeFilter
    Approval with this type.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Top
    Number of approvals to get. Default is 50.

.PARAMETER Project
    Project ID or project name

.PARAMETER AssignedToFilter
    Approvals assigned to this user.

.EXAMPLE
    PS C:\> Get-AdsReleaseApproval -ApiVersion $apiversion -Organization $organization -Project $project

    Get a list of approvals

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ContinuationToken,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseIdsFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeMyGroupApprovals,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TypeFilter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AssignedToFilter
    )
    process {
        $__mapping = @{
            'QueryOrder' = 'queryOrder'
            'ContinuationToken' = 'continuationToken'
            'ApiVersion' = 'api-version'
            'ReleaseIdsFilter' = 'releaseIdsFilter'
            'StatusFilter' = 'statusFilter'
            'IncludeMyGroupApprovals' = 'includeMyGroupApprovals'
            'TypeFilter' = 'typeFilter'
            'Top' = 'top'
            'AssignedToFilter' = 'assignedToFilter'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('QueryOrder','ContinuationToken','ApiVersion','ReleaseIdsFilter','StatusFilter','IncludeMyGroupApprovals','TypeFilter','Top','AssignedToFilter') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/approvals' -Replace '{organization}',$Organization -Replace '{project}',$Project
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}