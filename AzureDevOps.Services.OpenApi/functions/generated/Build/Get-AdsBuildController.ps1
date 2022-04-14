function Get-AdsBuildController {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets controller, optionally filtered by name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Name
    

.PARAMETER ControllerId
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsBuildController -Organization $organization -ControllerId $controllerid -ApiVersion $apiversion

    Gets a controller

.EXAMPLE
    PS C:\> Get-AdsBuildController -Organization $organization -ApiVersion $apiversion

    Gets controller, optionally filtered by name

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Controllers_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Controllers_Get')]
        [string]
        $ControllerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Controllers_Get')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'Name' = 'name'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('Name','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/build/controllers' -Replace '{organization}',$Organization
        if ($ControllerId) { $__path += "/$ControllerId" }

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}