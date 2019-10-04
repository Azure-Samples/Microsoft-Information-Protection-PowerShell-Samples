<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

# Step 1: Authenticate to SCC

# Step 2: Get all labels to identify which label you want the settings for
Get-Label | Format-Table -Property DisplayName, Name, Guid

# Step 3: Get the settings for the label General
(Get-Label -Identity "General").Settings
