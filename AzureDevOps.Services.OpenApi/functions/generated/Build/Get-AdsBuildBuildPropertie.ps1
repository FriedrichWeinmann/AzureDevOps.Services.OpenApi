function Get-AdsBuildBuildPropertie {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets properties for a build.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Filter
    A comma-delimited list of properties. If specified, filters to these specific properties.

.PARAMETER Project
    Project ID or project name

.PARAMETER BuildId
    The ID of the build.

.EXAMPLE
    PS C:\> Get-AdsBuildBuildPropertie -Organization $organization -ApiVersion $apiversion -Project $project -BuildId $buildid

    Gets properties for a build.

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
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Filter,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $BuildId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Filter' = 'filter'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Filter') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/builds/{buildId}/properties' -Replace '{organization}',$Organization -Replace '{project}',$Project -Replace '{buildId}',$BuildId

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}