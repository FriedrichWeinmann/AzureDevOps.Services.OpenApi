function Remove-AdsExtensionmanagementInstalledextensionsbyname {
<#
.SYNOPSIS
    

.DESCRIPTION
    Uninstall the specified extension from the account / project collection.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Reason
    

.PARAMETER ExtensionName
    Name of the extension. Example: "ops-tools".

.PARAMETER PublisherName
    Name of the publisher. Example: "fabrikam".

.PARAMETER ReasonCode
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Remove-AdsExtensionmanagementInstalledextensionsbyname -Organization $organization -ExtensionName $extensionname -PublisherName $publishername -ApiVersion $apiversion

    Uninstall the specified extension from the account / project collection.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Reason,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ExtensionName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ReasonCode,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Reason' = 'reason'
            'ReasonCode' = 'reasonCode'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Reason','ReasonCode','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensionsbyname/{publisherName}/{extensionName}' -Replace '{organization}',$Organization -Replace '{extensionName}',$ExtensionName -Replace '{publisherName}',$PublisherName

        Invoke-RestRequest -Path $__path -Method delete -Body $__body -Query $__query -Header $__header
    }
}