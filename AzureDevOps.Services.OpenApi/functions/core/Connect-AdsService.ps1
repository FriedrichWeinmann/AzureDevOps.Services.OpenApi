function Connect-AdsService {
	<#
	.SYNOPSIS
		Connect to Azure DevOps Services
	
	.DESCRIPTION
		Connect to Azure DevOps Services
		Use either a PAT or Azure AD Authentication.

		Note: AzureAD auth is currently broken, cause is being investigated.
	
	.PARAMETER ClientID
		The ClientID of the App Registration to use.
		Used for AzureAD Authentication.
	
	.PARAMETER TenantID
		The ID of the Tenant to log in for.
		Used for AzureAD Authentication.
	
	.PARAMETER Credential
		The credentials to use for authenticating to Azure DevOps Services.
		This expects the user UPN as username and a PAT as password.
	
	.EXAMPLE
		PS C:\> Connect-AdsService -Credential $cred

		Log into the Azure DevOps API using a Personal Access Token
	#>
	[CmdletBinding(DefaultParameterSetName = 'AzureAD')]
	param (
		[Parameter(Mandatory = $true, ParameterSetName = 'AzureAD')]
		[string]
		$ClientID,
		
		[Parameter(Mandatory = $true, ParameterSetName = 'AzureAD')]
		[string]
		$TenantID,

		[Parameter(Mandatory = $true, ParameterSetName = 'PAT')]
		[PSCredential]
		$Credential
	)

	switch ($PSCmdlet.ParameterSetName) {
		'AzureAD' {
			$param = @{
				Service    = 'AzureDevOps'
				ServiceUrl = 'https://dev.azure.com'
				ClientID   = $ClientID
				TenantID   = $TenantID
				Scopes     = 'https://app.vssps.visualstudio.com/.default'
				DeviceCode = $true
			}
			Connect-RestService @param
			# Disable Redirects on authorization errors
			Set-RestConnection -Service AzureDevOps -ExtraHeaderContent @{ 'X-TFS-FedAuthRedirect' = 'Suppress' }
		}
		'PAT' {
			$param = @{
				Service       = 'AzureDevOps'
				ServiceUrl    = 'https://dev.azure.com'
				Data          = @{ Credential = $Credential }
				ValidUntil    = (Get-Date).AddYears(1)
				GetHeaderCode = {
					param ( $Token )

					$credential = $Token.Data.Credential
					if (-not $credential) { throw "No Credentials provided for connecting to Azure DevOps Services via PAT!" }
					$string = $credential.UserName, $credential.GetNetworkCredential().Password -join ":"
					$bytes = [System.Text.Encoding]::UTF8.GetBytes($string)
					$base64 = [convert]::ToBase64String($bytes)
					@{ Authorization = "Basic $base64" }
				}
				ExtraHeaderContent = @{ 'X-TFS-FedAuthRedirect' = 'Suppress' }
			}
			Set-RestConnection @param
		}
	}
}