function Get-AdsExtensionmanagementInstalledextensionsbyname {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get an installed extension by its publisher and extension name.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER PublisherName
    Name of the publisher. Example: "fabrikam".

.PARAMETER ExtensionName
    Name of the extension. Example: "ops-tools".

.PARAMETER AssetTypes
    Determines which files are returned in the files array.  Provide the wildcard '*' to return all files, or a colon separated list to retrieve files with specific asset types.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsExtensionmanagementInstalledextensionsbyname -Organization $organization -PublisherName $publishername -ExtensionName $extensionname -ApiVersion $apiversion

    Get an installed extension by its publisher and extension name.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ExtensionName,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AssetTypes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'AssetTypes' = 'assetTypes'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('AssetTypes','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensionsbyname/{publisherName}/{extensionName}' -Replace '{organization}',$Organization -Replace '{publisherName}',$PublisherName -Replace '{extensionName}',$ExtensionName

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}