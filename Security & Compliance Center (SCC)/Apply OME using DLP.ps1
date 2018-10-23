<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

# Notes: Based on Shalini's Yammer post.

# Step 1 - Authenticate to SCC FIRST.

$SensitiveTypes = @( 
    @{Name="U.S. Social Security Number (SSN)"; minCount="1"},
    @{Name="Credit Card Number"; minCount="1"},
    @{Name="U.S. / U.K. Passport Number"; minCount="1"},
    @{Name="U.S. Bank Account Number"; minCount="1"},
    @{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"}
)

# Syntax: https://docs.microsoft.com/en-us/powershell/module/exchange/policy-and-compliance-dlp/new-dlpcompliancepolicy?view=exchange-ps
New-DlpCompliancePolicy `
    -Name "Encrypt outbound sensitive emails (out of box policy)" `
    -ExchangeLocation "All"

# Syntax: https://docs.microsoft.com/en-us/powershell/module/exchange/policy-and-compliance-dlp/new-dlpcompliancerule?view=exchange-ps
New-DlpComplianceRule `
    -Name "Encrypt outbound sensitive emails" `
    -Policy "Encrypt outbound sensitive emails (out of box policy)" `
    -AccessScope NotInOrganization `
    -EncryptRMSTemplate "Encrypt" `
    -NotifyUser "LastModifier" `
    -NotifyPolicyTipCustomText "This email contains sensitive information and will be encrypted." `
    -NotifyEmailCustomText "This email contains sensitive information and will be encrypted." `
    -ContentContainsSensitiveInformation $SensitiveTypes