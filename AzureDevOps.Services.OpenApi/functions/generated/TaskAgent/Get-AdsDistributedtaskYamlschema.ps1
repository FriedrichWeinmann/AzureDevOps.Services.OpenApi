function Get-AdsDistributedtaskYamlschema {
<#
.SYNOPSIS
    

.DESCRIPTION
    GET the Yaml schema used for Yaml file validation.

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ValidateTaskNames
    Whether the schema should validate that tasks are actually installed (useful for offline tools where you don't want validation).

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.1' to use this version of the api.

.EXAMPLE
    PS C:\> Get-AdsDistributedtaskYamlschema -Organization $organization -ApiVersion $apiversion

    GET the Yaml schema used for Yaml file validation.

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
        $ValidateTaskNames,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'ValidateTaskNames' = 'validateTaskNames'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('ValidateTaskNames','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/_apis/distributedtask/yamlschema' -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method get -Body $__body -Query $__query -Header $__header
    }
}