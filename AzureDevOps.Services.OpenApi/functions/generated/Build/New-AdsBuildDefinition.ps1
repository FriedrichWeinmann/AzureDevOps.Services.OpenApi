function New-AdsBuildDefinition {
<#
.SYNOPSIS
    

.DESCRIPTION
    Updates an existing build definition.  In order for this operation to succeed, the value of the "Revision" property of the request body must match the existing build definition's. It is recommended that you obtain the existing build definition by using GET, modify the build definition as necessary, and then submit the modified definition with PUT.

.PARAMETER SecretsSourceDefinitionRevision
    

.PARAMETER DefinitionId
    The ID of the definition.

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER SecretsSourceDefinitionId
    

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.7' to use this version of the api.

.EXAMPLE
    PS C:\> New-AdsBuildDefinition -DefinitionId $definitionid -Project $project -Organization $organization -ApiVersion $apiversion

    Updates an existing build definition.  In order for this operation to succeed, the value of the "Revision" property of the request body must match the existing build definition's. It is recommended that you obtain the existing build definition by using GET, modify the build definition as necessary, and then submit the modified definition with PUT.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $SecretsSourceDefinitionRevision,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $DefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [int32]
        $SecretsSourceDefinitionId,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'SecretsSourceDefinitionRevision' = 'secretsSourceDefinitionRevision'
            'SecretsSourceDefinitionId' = 'secretsSourceDefinitionId'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('SecretsSourceDefinitionRevision','SecretsSourceDefinitionId','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/build/definitions/{definitionId}' -Replace '{definitionId}',$DefinitionId -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}