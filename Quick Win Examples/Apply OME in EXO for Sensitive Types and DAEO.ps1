<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

# Notes: Based on Shalini's Yammer post: https://www.yammer.com/askipteam/#/Threads/show?threadId=1165706442

# Step 1 - Authenticate to EXO FIRST.

$SensitiveTypes = @( 
    @{Name="U.S. Social Security Number (SSN)"; minCount="1"},
    @{Name="Credit Card Number"; minCount="1"},
    @{Name="U.S. / U.K. Passport Number"; minCount="1"},
    @{Name="U.S. Bank Account Number"; minCount="1"},
    @{Name="U.S. Individual Taxpayer Identification Number (ITIN)"; minCount="1"}
)

# Go to S/MIME Encryption mode
Set-IRMConfiguration -DecryptAttachmentForEncryptOnly $true

# Create an EO mail flow rule for DLP policy hits
New-TransportRule -Name "Default OME policy Encrypt external mails with sensitive content" `
    -SentToScope NotInOrganization `
    -ApplyRightsProtectionTemplate "Encrypt" `
    -MessageContainsDataClassifications $SensitiveTypes