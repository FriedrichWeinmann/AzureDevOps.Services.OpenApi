[CmdletBinding()]
param ()

function Convert-Name {
	[CmdletBinding()]
	param (
		[string]
		$Name,

		[string]
		$Component,

		[hashtable]
		$Data
	)

	$newName = $Name

	# Global
	foreach ($key in $data.Global.Keys) {
		$newName = $newName -replace $key, $data.Global[$key]
	}

	# Component
	foreach ($key in $data.components.$Component.Keys) {
		$newName = $newName -replace $key, $data.components.$Component[$key]
	}

	# Command
	foreach ($key in $data.individual.$Name.Keys) {
		$newName = $newName -replace $key, $data.individual.$Name[$key]
	}

	$newName
}

$projectRoot = Split-Path -Path $PSScriptRoot
$swaggerRoot = Join-Path -Path $projectRoot -ChildPath swagger
$exportRoot = Join-path -Path $projectRoot -ChildPath "AzureDevOps.Services.OpenApi\functions\generated"
$renameData = Import-PSFPowerShellDataFile -Path "$PSScriptRoot\Build-Swagger-Renames.psd1"

$paramConvertFromARSwagger = @{
	RestCommand   = 'Invoke-RestRequest'
	ModulePrefix  = 'Ads'
	PathPrefix    = '/'
	TransformPath = "$PSScriptRoot\overrides"
}

Remove-Item -Path "$projectRoot\AzureDevOps.Services.OpenApi\functions\generated\*" -Recurse -Force

$commandNames = foreach ($document in Get-ChildItem -Path $swaggerRoot -Filter *.json) {
	Write-Host "Processing: $($document.FullName)"
	$swaggerData = Get-Content -Path $document.FullName | ConvertFrom-Json
	if (-not $swaggerData.Paths) { continue }
	if (@($swaggerData.Paths.PSObject.Properties).Count -lt 1) { continue }
	$name = $swaggerData.info.title
	if (-not $name) { $name = $document.BaseName }

	$baseUri = 'https://{0}' -f $swaggerData.host

	$exportPath = Join-Path -Path $exportRoot -ChildPath $name
	$null = New-Item -Path $exportPath -ItemType Directory -ErrorAction Ignore
	$commands = $document | ConvertFrom-ARSwagger @paramConvertFromARSwagger
	foreach ($command in $commands) {
		$command.EndpointUrl = $baseUri, $command.EndpointUrl -join "/"
		$command.Name = Convert-Name -Name $command.Name -Component $name -Data $renameData
		if ($command.Name -like "*{*") {
			Write-Warning "Badly formed command, skipping for now: $($command.Name) ($($command.EndpointUrl))"
		}
	}
	$commands = $commands | Where-Object Name -notlike "*{*"
	$commands | Export-ARCommand -Path $exportPath
	$commands.Name | Sort-Object -Unique
}

# Update Module Manifest
$encoding = [System.Text.UTF8Encoding]::new($true)
$manifestData = [System.IO.File]::ReadAllText("$projectRoot\build\data\AzureDevOps.Services.OpenApi.psd1", $encoding)
$commandsString = $commandNames -join "', '"
$manifestData = $manifestData -replace '%COMMANDS%',$commandsString
[System.IO.File]::WriteAllText("$projectRoot\AzureDevOps.Services.OpenApi\AzureDevOps.Services.OpenApi.psd1", $manifestData, $encoding)