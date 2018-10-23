<#
.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.
#>

# Connect to Security & Compliance Center
if (!$UserCredential) { $UserCredential = Get-Credential }

# Assuming your tenant isn't in Germany (see link below if you do).
# For variations on check out this link - https://docs.microsoft.com/en-gb/powershell/exchange/office-365-scc/connect-to-scc-powershell/connect-to-scc-powershell?view=exchange-ps

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
if ($Session) {
    
    Import-PSSession $Session -DisableNameChecking
}