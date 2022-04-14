function Get-AdsTfvcShelveset {
<#
.SYNOPSIS
    Get a single deep shelveset.

.DESCRIPTION
    Get a single deep shelveset.

.PARAMETER Owner
    Owner's ID. Could be a name or a guid.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IncludeWorkItems
    Whether to include workItems

.PARAMETER IncludeDetails
    Whether to include policyOverride and notes Only applies when requesting a single deep shelveset

.PARAMETER MaxChangeCount
    Max number of changes to include

.PARAMETER Name
    Shelveset name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER MaxCommentLength
    Max length of comment

.PARAMETER ShelvesetId
    Shelveset's unique ID

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references. Does not apply when requesting a single deep shelveset object. Links will always be included in the deep shelveset.

.EXAMPLE
    PS C:\> Get-AdsTfvcShelveset -ApiVersion $apiversion -Organization $organization -ShelvesetId $shelvesetid

    Get a single deep shelveset.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeWorkItems,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxChangeCount,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxCommentLength,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ShelvesetId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks
    )
    process {
        $__mapping = @{
            'Owner' = 'requestData.owner'
            'ApiVersion' = 'api-version'
            'IncludeWorkItems' = 'requestData.includeWorkItems'
            'IncludeDetails' = 'requestData.includeDetails'
            'MaxChangeCount' = 'requestData.maxChangeCount'
            'Name' = 'requestData.name'
            'MaxCommentLength' = 'requestData.maxCommentLength'
            'ShelvesetId' = 'shelvesetId'
            'IncludeLinks' = 'requestData.includeLinks'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Owner','ApiVersion','IncludeWorkItems','IncludeDetails','MaxChangeCount','Name','MaxCommentLength','ShelvesetId','IncludeLinks') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/tfvc/shelvesets' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}