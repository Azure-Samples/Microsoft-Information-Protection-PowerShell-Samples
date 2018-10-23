<#
.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.
#>

# Connect to EXO
if (!$UserCredential) { $UserCredential = Get-Credential }

# Assuming account doesn't have MFA enabled (see link below if you do).
# For variations on EXO check out this link - https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell?view=exchange-ps

Write-Host ""
write-host "[1] to connect to EXO."
write-host "[2] to connect to EXO with EOP."
$choice = Read-Host -Prompt 'Enter a number between 1-2'

switch ($choice) {

    '2' { 
        
            $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
        }
    default { 
    
            $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https:/outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection    
        }
}

if ($Session) {
    
    Import-PSSession $Session
}