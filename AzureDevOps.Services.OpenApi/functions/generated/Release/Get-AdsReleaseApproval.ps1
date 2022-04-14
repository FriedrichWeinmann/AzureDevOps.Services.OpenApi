function Get-AdsReleaseApproval {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get a list of approvals

.PARAMETER StatusFilter
    Approvals with this status. Default is 'pending'.

.PARAMETER TypeFilter
    Approval with this type.

.PARAMETER IncludeMyGroupApprovals
    'true' to include my group approvals. Default is 'false'.

.PARAMETER ReleaseIdsFilter
    Approvals for release id(s) mentioned in the filter. Multiple releases can be mentioned by separating them with ',' e.g. releaseIdsFilter=1,2,3,4.

.PARAMETER ContinuationToken
    Gets the approvals after the continuation token provided.

.PARAMETER Top
    Number of approvals to get. Default is 50.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER QueryOrder
    Gets the results in the defined order of created approvals. Default is 'descending'.

.PARAMETER AssignedToFilter
    Approvals assigned to this user.

.EXAMPLE
    PS C:\> Get-AdsReleaseApproval -Project $project -ApiVersion $apiversion -Organization $organization

    Get a list of approvals

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $StatusFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $TypeFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeMyGroupApprovals,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReleaseIdsFilter,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $ContinuationToken,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Top,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $QueryOrder,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AssignedToFilter
    )
    process {
        $__mapping = @{
            'StatusFilter' = 'statusFilter'
            'TypeFilter' = 'typeFilter'
            'IncludeMyGroupApprovals' = 'includeMyGroupApprovals'
            'ReleaseIdsFilter' = 'releaseIdsFilter'
            'ContinuationToken' = 'continuationToken'
            'Top' = 'top'
            'ApiVersion' = 'api-version'
            'QueryOrder' = 'queryOrder'
            'AssignedToFilter' = 'assignedToFilter'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('StatusFilter','TypeFilter','IncludeMyGroupApprovals','ReleaseIdsFilter','ContinuationToken','Top','ApiVersion','QueryOrder','AssignedToFilter') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://vsrm.dev.azure.com/{organization}/{project}/_apis/release/approvals' -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}