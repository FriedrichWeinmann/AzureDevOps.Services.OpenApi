function Set-AdsBuildBuild {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates multiple builds.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Retry
    

.PARAMETER BuildId
    The ID of the build.

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.EXAMPLE
    PS C:\> Set-AdsBuildBuild -Organization $organization -BuildId $buildid -Project $project -ApiVersion $apiversion

    Updates a build.

.EXAMPLE
    PS C:\> Set-AdsBuildBuild -Organization $organization -Project $project -ApiVersion $apiversion

    Updates multiple builds.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Update Build')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Update Build')]
        [boolean]
        $Retry,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Update Build')]
        [string]
        $BuildId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Update Build')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Builds_Update Build')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Retry' = 'retry'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Retry','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/builds' -Replace '{organization}',$Organization -Replace '{project}',$Project
        if ($BuildId) { $__path += "/$BuildId" }

        Invoke-RestRequest -Path $__path -Method patch -Body $__body -Query $__query -Header $__header
    }
}