function Get-AdsTfvcShelveset {
<#
.SYNOPSIS
    Get a single deep shelveset.

.DESCRIPTION
    Get a single deep shelveset.

.PARAMETER Name
    Shelveset name

.PARAMETER IncludeDetails
    Whether to include policyOverride and notes Only applies when requesting a single deep shelveset

.PARAMETER IncludeLinks
    Whether to include the _links field on the shallow references. Does not apply when requesting a single deep shelveset object. Links will always be included in the deep shelveset.

.PARAMETER IncludeWorkItems
    Whether to include workItems

.PARAMETER Owner
    Owner's ID. Could be a name or a guid.

.PARAMETER MaxChangeCount
    Max number of changes to include

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ShelvesetId
    Shelveset's unique ID

.PARAMETER MaxCommentLength
    Max length of comment

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
        $Name,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDetails,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeWorkItems,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Owner,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxChangeCount,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ShelvesetId,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $MaxCommentLength
    )
    process {
        $__mapping = @{
            'Name' = 'requestData.name'
            'IncludeDetails' = 'requestData.includeDetails'
            'IncludeLinks' = 'requestData.includeLinks'
            'IncludeWorkItems' = 'requestData.includeWorkItems'
            'Owner' = 'requestData.owner'
            'MaxChangeCount' = 'requestData.maxChangeCount'
            'ApiVersion' = 'api-version'
            'ShelvesetId' = 'shelvesetId'
            'MaxCommentLength' = 'requestData.maxCommentLength'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Name','IncludeDetails','IncludeLinks','IncludeWorkItems','Owner','MaxChangeCount','ApiVersion','ShelvesetId','MaxCommentLength') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/tfvc/shelvesets' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}