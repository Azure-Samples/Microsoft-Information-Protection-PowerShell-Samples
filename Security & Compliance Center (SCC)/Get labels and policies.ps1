<#

.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.

#>

# Step 1: Authenticate to SCC

# Get the list of labels and format them showing key propeties
Get-Label | Format-Table -Property DisplayName, Name, Guid

# Get the list of label policies and format them showing key properties
Get-LabelPolicy | Format-Table -Property DisplayName, Name, Guid
