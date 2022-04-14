function Remove-AdsExtensionmanagementInstalledextensionsbyname {
<#
.SYNOPSIS
    

.DESCRIPTION
    Uninstall the specified extension from the account / project collection.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Reason
    

.PARAMETER ReasonCode
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PublisherName
    Name of the publisher. Example: "fabrikam".

.PARAMETER ExtensionName
    Name of the extension. Example: "ops-tools".

.EXAMPLE
    PS C:\> Remove-AdsExtensionmanagementInstalledextensionsbyname -ApiVersion $apiversion -Organization $organization -PublisherName $publishername -ExtensionName $extensionname

    Uninstall the specified extension from the account / project collection.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Reason,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReasonCode,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ExtensionName
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Reason' = 'reason'
            'ReasonCode' = 'reasonCode'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Reason','ReasonCode') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensionsbyname/{publisherName}/{extensionName}' -Replace '{organization}',$Organization -Replace '{publisherName}',$PublisherName -Replace '{extensionName}',$ExtensionName
        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}