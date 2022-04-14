function Get-AdsHookPublisherEventtype {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get the event types for a specific publisher.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PublisherId
    ID for a publisher.

.PARAMETER EventTypeId
    

.EXAMPLE
    PS C:\> Get-AdsHookPublisherEventtype -ApiVersion $apiversion -Organization $organization -PublisherId $publisherid

    Get the event types for a specific publisher.

.EXAMPLE
    PS C:\> Get-AdsHookPublisherEventtype -ApiVersion $apiversion -Organization $organization -PublisherId $publisherid -EventTypeId $eventtypeid

    Get a specific event type.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Publishers_Get Event Type')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Publishers_Get Event Type')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Publishers_Get Event Type')]
        [string]
        $PublisherId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Publishers_Get Event Type')]
        [string]
        $EventTypeId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/hooks/publishers/{publisherId}/eventtypes' -Replace '{organization}',$Organization -Replace '{publisherId}',$PublisherId
        if ($EventTypeId) { $__path += "/$EventTypeId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}