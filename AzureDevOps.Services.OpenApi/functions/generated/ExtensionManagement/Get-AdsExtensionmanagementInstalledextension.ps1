function Get-AdsExtensionmanagementInstalledextension {
<#
.SYNOPSIS
    

.DESCRIPTION
    List the installed extensions in the account / project collection.

.PARAMETER AssetTypes
    Determines which files are returned in the files array.  Provide the wildcard '*' to return all files, or a colon separated list to retrieve files with specific asset types.

.PARAMETER IncludeInstallationIssues
    

.PARAMETER IncludeErrors
    If true, include installed extensions with errors.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IncludeDisabledExtensions
    If true (the default), include disabled extensions in the results.

.EXAMPLE
    PS C:\> Get-AdsExtensionmanagementInstalledextension -Organization $organization -ApiVersion $apiversion

    List the installed extensions in the account / project collection.

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $AssetTypes,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeInstallationIssues,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeErrors,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDisabledExtensions
    )
    process {
        $__mapping = @{
            'AssetTypes' = 'assetTypes'
            'IncludeInstallationIssues' = 'includeInstallationIssues'
            'IncludeErrors' = 'includeErrors'
            'ApiVersion' = 'api-version'
            'IncludeDisabledExtensions' = 'includeDisabledExtensions'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('AssetTypes','IncludeInstallationIssues','IncludeErrors','ApiVersion','IncludeDisabledExtensions') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://extmgmt.dev.azure.com/{organization}/_apis/extensionmanagement/installedextensions' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}