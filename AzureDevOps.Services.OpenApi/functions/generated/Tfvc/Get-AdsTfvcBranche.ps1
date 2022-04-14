function Get-AdsTfvcBranche {
<#
.SYNOPSIS
    

.DESCRIPTION
    Get branch hierarchies below the specified scopePath

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER IncludeLinks
    Return links. Default: False

.PARAMETER Project
    Project ID or project name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.PARAMETER IncludeDeleted
    Return deleted branches. Default: False

.PARAMETER ScopePath
    Full path to the branch.  Default: $/ Examples: $/, $/MyProject, $/MyProject/SomeFolder.

.EXAMPLE
    PS C:\> Get-AdsTfvcBranche -Organization $organization -Project $project -ApiVersion $apiversion -ScopePath $scopepath

    Get branch hierarchies below the specified scopePath

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeLinks,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [boolean]
        $IncludeDeleted,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ScopePath
    )
    process {
        $__mapping = @{
            'IncludeLinks' = 'includeLinks'
            'ApiVersion' = 'api-version'
            'IncludeDeleted' = 'includeDeleted'
            'ScopePath' = 'scopePath'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('IncludeLinks','ApiVersion','IncludeDeleted','ScopePath') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/tfvc/branches' -Replace '{organization}',$Organization -Replace '{project}',$Project

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}