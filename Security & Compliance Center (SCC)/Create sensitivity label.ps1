<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

# Step 1: Authenticate to SCC

# Labels are of type:  Deserialized.Microsoft.Office.CompliancePolicy.Tasks.PsLabel
New-Label -Comment "Created from AIP PowerShell Snippets" -DisplayName "Leadership" -Name "Leadership" -Tooltip "Label for Senior leadership team"