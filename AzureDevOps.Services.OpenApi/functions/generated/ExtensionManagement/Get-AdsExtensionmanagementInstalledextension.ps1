function Get-AdsExtensionmanagementInstalledextension {
<#
.SYNOPSIS
    

.DESCRIPTION
    List the installed extensions in the account / project collection.

.PARAMETER IncludeDisabledExtensions
    If true (the default), include disabled extensions in the results.

.PARAMETER IncludeInstallationIssues
    

.PARAMETER IncludeErrors
    If true, include installed extensions with errors.

.PARAMETER AssetTypes
    Determines which files are returned in the files array.  Provide the wildcard '*' to return all files, or a colon separated list to retrieve files with specific asset types.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.EXAMPLE
    PS C:\> Get-AdsExtensionmanagementInstalledextension -ApiVersion $apiversion -Organization $organization

    List the installed extensions in the account / project collection.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDisabledExtensions,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeInstallationIssues,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeErrors,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AssetTypes,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization
    )
    process {
        $__mapping = @{
            'IncludeDisabledExtensions' = 'includeDisabledExtensions'
            'IncludeInstallationIssues' = 'includeInstallationIssues'
            'IncludeErrors' = 'includeErrors'
            'AssetTypes' = 'assetTypes'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeDisabledExtensions','IncludeInstallationIssues','IncludeErrors','AssetTypes','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensions' -Replace '{organization}',$Organization
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}