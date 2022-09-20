<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

<#
Notes:     Additional details in the online documentation - 
            https://docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-customizations#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent

#>

# Step 1 - Authenticate to SCC FIRST.
# https://learn.microsoft.com/en-us/powershell/exchange/connect-to-scc-powershell?view=exchange-ps

Connect-IPPSSession 


# Step 2 - Define our trusted domains and Policy the settings will be applied to
$PolicyName = "General"
$TrustedDomains = "microsoft.com"

# Listing trusted domains:
Set-LabelPolicy -Identity $PolicyName -AdvancedSettings @{OutlookWarnTrustedDomains=$TrustedDomains}
Set-LabelPolicy -Identity $PolicyName -AdvancedSettings @{OutlookJustifyTrustedDomains=$TrustedDomains}
Set-LabelPolicy -Identity $PolicyName -AdvancedSettings @{OutlookBlockTrustedDomains=$TrustedDomains}

# Step 3 - Get a list of labels so that we can get the label GUID for General, Confidential, and HighlyConfidential labels
Get-Label | Format-Table -Property DisplayName, Name, Guid
<#
  Step 4 - populate the label ID's (GUID) for each label you want to warn, justify or block.
  You can either manually populate the variables below with the GUIDS from the list (copy and paste) as in 4a, or run the command in 4b

  Step 4a - manually set the variables:
  $WarnLabelIds="4e40033f-508a-4f06-b610-f6c1e0874379" # General label Id
  $JustifyLabelIds="75a9204-0ef6-4581-8c9e-69242aefe755" # Confidential label Id
  $BlockLabelIds="c279640a-a77f-4948-82e6-9efeb1774a4c" # Highly Confidential label Id

  Multiple labels can be provided by comma seperating the Guids. See the documentation for advanced settings for more information:
  https://docs.microsoft.com/en-us/azure/information-protection/rms-client/clientv2-admin-guide-customizations#how-to-configure-advanced-settings-for-the-client-by-using-office-365-security--compliance-center-powershell
#>

# Step 4b - script retrieving the label Id and assignign this to relevent variable
$WarnLabelIds = Get-Label -Identity "General" | Select-Object -ExpandProperty Guid
$JustifyLabelIds = Get-Label -Identity "Confidential" | Select-Object -ExpandProperty Guid
$BlockLabelIds = Get-Label -Identity "Highly Confidential" | Select-Object -ExpandProperty Guid

# Step 5 - Configuring labels to warn, justify, or block:
Set-LabelPolicy -Identity $PolicyName -AdvancedSettings @{OutlookWarnUntrustedCollaborationLabel=$WarnLabelIds}
Set-LabelPolicy -Identity $PolicyName -AdvancedSettings @{OutlookJustifyUntrustedCollaborationLabel=$JustifyLabelIds}
Set-LabelPolicy -Identity $PolicyName -AdvancedSettings @{OutlookBlockUntrustedCollaborationLabel=$BlockLabelIds}

# Step 6 - validate the settings are correct:
(Get-LabelPolicy -Identity $PolicyName).settings
