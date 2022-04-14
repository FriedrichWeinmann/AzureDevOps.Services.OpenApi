[CmdletBinding()]
param ()

$projectRoot = Split-Path -Path $PSScriptRoot
$swaggerRoot = Join-Path -Path $projectRoot -ChildPath swagger

Remove-Item -Path "$swaggerRoot\*.json"

$tempFolder = New-Item -Path $env:TEMP -Name "swagger-$(Get-Random)" -ItemType Directory

Push-Location -Path $tempFolder.FullName
git clone https://github.com/MicrosoftDocs/vsts-rest-api-specs.git | Where-Object { $_ -notlike '*httpExamples*' }
Pop-Location

foreach ($folder in Get-ChildItem -Path "$($tempFolder.FullName)\vsts-rest-api-specs\specification") {
	if (-not $folder.PSIsContainer) { continue }

	$subFolder = Get-ChildItem -Path $folder.FullName | Where-Object Name -Match "^[\d\.]+$" | Sort-Object -Descending | Select-Object -First 1
	if (-not $subFolder) { continue }

	Get-Item -Path "$($subFolder.FullName)\*.json" | Copy-Item -Destination $swaggerRoot
}
foreach ($file in Get-Item -Path "$swaggerRoot\*.json") {
	(Get-Content -LiteralPath $file.FullName) | Set-String -OldValue '"":' -NewValue '"empty":' | Set-Content -LiteralPath $file.FullName
}

Remove-Item -Path $tempFolder.FullName -Force -Recurse