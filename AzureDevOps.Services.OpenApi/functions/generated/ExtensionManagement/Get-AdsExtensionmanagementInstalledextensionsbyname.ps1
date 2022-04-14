function Get-AdsExtensionmanagementInstalledextensionsbyname {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get an installed extension by its publisher and extension name.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER PublisherName
    Name of the publisher. Example: "fabrikam".

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER AssetTypes
    Determines which files are returned in the files array.  Provide the wildcard '*' to return all files, or a colon separated list to retrieve files with specific asset types.

.PARAMETER ExtensionName
    Name of the extension. Example: "ops-tools".

.EXAMPLE
    PS C:\> Get-AdsExtensionmanagementInstalledextensionsbyname -ApiVersion $apiversion -PublisherName $publishername -Organization $organization -ExtensionName $extensionname

    Get an installed extension by its publisher and extension name.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $PublisherName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AssetTypes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ExtensionName
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'AssetTypes' = 'assetTypes'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','AssetTypes') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensionsbyname/{publisherName}/{extensionName}' -Replace '{publisherName}',$PublisherName -Replace '{organization}',$Organization -Replace '{extensionName}',$ExtensionName
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}