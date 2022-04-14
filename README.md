# Description

Client Module for the Azure DevOps api.
This module is mostly auto-generated using AutoRest, which allowed mapping the entire API in reasonable time, but means that some of the commands are missing help and that ... well, that both command naming and PowerShell usability (such as Pipeline support) could be improved upon.

> Some very few API endpoints are still missing and some few are only partially available, as this is a work in progress.

## Connecting

To establish a connection use `Connect-AdsService`:

```powershell
Connect-AdsService -Credential $cred
```

Where `$cred` contains a credential object with the user's UPN / mail and a Personal Access Token (PAT) as Password.

> Theoretically, Azure AD authentication should work, using the ClientID and TenantID parameters instead, but there's some backend trouble which I'm still investigating.

## Installing

```powershell
Install-Module AzureDevOps.Services.OpenApi -Scope CurrentUser
```

## Using

> List all projects in your organization

```powershell
Get-AdsProject -Organization $orgName -ApiVersion 6.0
```

> List all PowerShell script files

```powershell
Get-AdsRepositoryFile -Organization $orgName -IncludeContent -Name *.ps1,*.psm1
```

This will search through all branches in all repositories in all projects in the specified organization and return all .ps1 and .psm1 files, including the actual file-content.
