function Test-Overlap {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Value,

		[Parameter(Mandatory = $true)]
		[AllowEmptyCollection()]
		[AllowNull()]
		[string[]]
		$Filter,

		[switch]
		$Not
	)

	foreach ($filterString in $Filter) {
		if ($Value -like $filterString) { return $Not -eq $false }
	}
	$Not -eq $true
}