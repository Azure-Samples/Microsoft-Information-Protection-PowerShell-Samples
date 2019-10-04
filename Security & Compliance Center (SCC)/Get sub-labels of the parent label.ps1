<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

# Step 1: Authenticate to SCC

# Get the label for Confidential. Thisi s the top level label (parent)
$ParentLabel = get-label | Where-Object {$_.DisplayName -eq 'Confidential'}

# Using the GUID from the parent label we can find the active sub-labels
$SubLabels = get-label | Where-Object {$_.ParentId -eq $ParentLabel.Guid } | Select-Object DisplayName, Disabled