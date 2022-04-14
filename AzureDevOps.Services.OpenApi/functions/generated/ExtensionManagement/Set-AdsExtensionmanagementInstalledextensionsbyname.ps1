function Set-AdsExtensionmanagementInstalledextensionsbyname {
<#
.SYNOPSIS
    

.DESCRIPTION
    Install the specified extension into the account / project collection.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER PublisherName
    Name of the publisher. Example: "fabrikam".

.PARAMETER ExtensionName
    Name of the extension. Example: "ops-tools".

.PARAMETER Version
    

.EXAMPLE
    PS C:\> Set-AdsExtensionmanagementInstalledextensionsbyname -Organization $organization -ApiVersion $apiversion -PublisherName $publishername -ExtensionName $extensionname -Version $version

    Install the specified extension into the account / project collection.

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
        $PublisherName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ExtensionName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Version
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensionsbyname/{publisherName}/{extensionName}/{version}' -Replace '{organization}',$Organization -Replace '{publisherName}',$PublisherName -Replace '{extensionName}',$ExtensionName -Replace '{version}',$Version

        Invoke-RestRequest -Path $__path -Method post -Body $__body -Query $__query -Header $__header
    }
}