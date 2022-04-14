function Get-AdsBuildController {
<#
.SYNOPSIS
    

.DESCRIPTION
    Gets controller, optionally filtered by name

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.2' to use this version of the api.

.PARAMETER ControllerId
    

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER Name
    

.EXAMPLE
    PS C:\> Get-AdsBuildController -ApiVersion $apiversion -Organization $organization

    Gets controller, optionally filtered by name

.EXAMPLE
    PS C:\> Get-AdsBuildController -ApiVersion $apiversion -ControllerId $controllerid -Organization $organization

    Gets a controller

.LINK
    <unknown>
#>
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Controllers_Get')]
        [string]
        $ApiVersion,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Controllers_Get')]
        [string]
        $ControllerId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Controllers_Get')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Name
    )
    process {
        $__mapping = @{
            'ApiVersion' = 'api-version'
            'Name' = 'name'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ApiVersion','Name') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/build/controllers' -Replace '{organization}',$Organization
        if ($ControllerId) { $__path += "/$ControllerId" }
        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}