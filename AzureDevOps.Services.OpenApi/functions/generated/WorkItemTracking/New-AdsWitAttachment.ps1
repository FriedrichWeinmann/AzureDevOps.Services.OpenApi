function New-AdsWitAttachment {
<#
.SYNOPSIS
    

.DESCRIPTION
    Uploads an attachment chunk.

Before performing [**Upload a Chunk**](#upload_a_chunk), make sure to have an attachment id returned in **Start a Chunked Upload** example on **Create** section. Specify the byte range of the chunk using Content-Length. For example: "Content - Length": "bytes 0 - 39999 / 50000" for the first 40000 bytes of a 50000 byte file.

.PARAMETER FileName
    

.PARAMETER Id
    The id of the attachment

.PARAMETER Project
    Project ID or project name

.PARAMETER Organization
    The name of the Azure DevOps organization.

.PARAMETER ContentRangeHeader
    starting and ending byte positions for chunked file upload, format is "Content-Range": "bytes 0-10000/50000"

.PARAMETER ApiVersion
    Version of the API to use.  This should be set to '7.1-preview.3' to use this version of the api.

.EXAMPLE
    PS C:\> New-AdsWitAttachment -ContentRangeHeader $contentrangeheader

    <insert description here>

.EXAMPLE
    PS C:\> New-AdsWitAttachment -Id $id -Project $project -Organization $organization -ApiVersion $apiversion

    Uploads an attachment chunk.

Before performing [**Upload a Chunk**](#upload_a_chunk), make sure to have an attachment id returned in **Start a Chunked Upload** example on **Create** section. Specify the byte range of the chunk using Content-Length. For example: "Content - Length": "bytes 0 - 39999 / 50000" for the first 40000 bytes of a 50000 byte file.

.LINK
    <unknown>
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'default')]
    param (
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $FileName,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Id,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Project,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $Organization,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Recyclebin_Get')]
        [string]
        $ContentRangeHeader,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'default')]
        [string]
        $ApiVersion
    )
    process {
        $__mapping = @{
            'FileName' = 'fileName'
            'ContentRangeHeader' = 'contentRangeHeader'
            'ApiVersion' = 'api-version'
        }
        $__body = $PSBoundParameters | ConvertTo-Hashtable -Include @() -Mapping $__mapping
        $__query = $PSBoundParameters | ConvertTo-Hashtable -Include @('FileName','ApiVersion') -Mapping $__mapping
        $__header = $PSBoundParameters | ConvertTo-Hashtable -Include @('ContentRangeHeader') -Mapping $__mapping
        $__path = 'https://dev.azure.com/{organization}/{project}/_apis/wit/attachments/{id}' -Replace '{id}',$Id -Replace '{project}',$Project -Replace '{organization}',$Organization

        Invoke-RestRequest -Path $__path -Method put -Body $__body -Query $__query -Header $__header
    }
}