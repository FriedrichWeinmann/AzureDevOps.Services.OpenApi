function Get-AdsTestCodecoverage {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get code coverage data for a build.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER Flags
    Value of flags determine the level of code coverage details to be fetched. Flags are additive. Expected Values are 1 for Modules, 2 for Functions, 4 for BlockData.

.PARAMETER Project
    Project ID or project name

.PARAMETER BuildId
    ID of the build for which code coverage data needs to be fetched.

.EXAMPLE
    PS C:\> Get-AdsTestCodecoverage -Organization $organization -ApiVersion $apiversion -Flags $flags -Project $project -BuildId $buildid

    Get code coverage data for a build.

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

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $Flags,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $BuildId
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Flags' = 'flags'
            'BuildId' = 'buildId'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Flags','BuildId') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/test/codecoverage' -Replace '{organization}',$Organization -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}