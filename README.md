# Azure Information Protection Samples

This repository contains PowerShell snippets to demonstrate Azure Information Protection (AIP) functionality when interacting with the wider Microsoft cloud platform.

Checkout the Changelog to see what samples are currently avaialble.

The scripts are licensed "as-is." under the MIT License.

## Prerequisites
This will depend on whether samples are being run on the client or the cloud services (AzureIP or O365):
* Client: install the current Azure Information Protection add-in (https://aka.ms/aipclient)
* Cloud: depending on the samples run you will either need the PowerShell cmdlets installed with the client (refer to Additional resources for details) or
see Connecting to Exchange Online PowerShell (https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell?view=exchange-ps)
* An account with permissions to administer the AIP and optionally O365 Services
* PowerShell v5.0 on Windows 10 x64 (PowerShell v4.0 is a minimum requirement for the scripts to function correctly)

## Getting Started
After the prerequisites are installed or met, perform the following steps to use these scripts:

#### 1. Script Usage

* Download the contents of the repository to your local Windows machine
* Extract the files to a local folder (e.g. C:\Azure-Information-Protection-Samples)
* Run PowerShell x64 from the start menu
* Browse to the directory (e.g. cd C:\Azure-Information-Protection-Samples)
* For each Folder in the local repository you can browse to that directory and then run the script of your choice
* Most the scripts require authentication first. Auth examples can be found in the Authentication folder.
* Example Authentication script usage:
  * To connect to the Exchange Online PowerShell use the script from C:\Azure-Information-Protection-Samples, run "cd .\Authentication\"
  * Once in the folder run ".\Authenticate to EXO.ps1" and select whether this needs to be via Exchange Online Protection (EOP)
  This sequence of steps can be used for each folder....

#### Disclaimer

Some script samples retrieve information from your AIP and O365 tenant, and others may create, delete or update data in these tenants.  Understand the impact of each sample script prior to running it; samples should be run using a non-production or "test" tenant. 

## Questions and Comments

We're always interested in feedback. If you have any comments to share about the PowerShell samples you can send your questions and suggestions to us in the Issues section of this repository.

Your feedback is important to us. Connect with us on Stack Overflow. Tag your questions with [AzureIP].


## Additional Resources
* [Admin Guide: Using PowerShell with the Azure Information Protection client](https://docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-powershell)
* [Administering the Azure Rights Management service by using Windows PowerShell](https://docs.microsoft.com/en-us/azure/information-protection/administer-powershell)
* [Exchange Online PowerShell](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/exchange-online-powershell?view=exchange-ps)
* [Office 365 Security & Compliance Center PowerShell](https://docs.microsoft.com/en-gb/powershell/exchange/office-365-scc/office-365-scc-powershell?view=exchange-ps)
* [Azure Information Protection Blog](https://aka.ms/aipblogs)
* [Azure Information Protection Forum](https://www.yammer.com/AskIPteam)
* [Azure Information Protection Product Feerdback](https://msip.uservoice.com/)
* [Azure Information Protection Lab](https://aka.ms/AIPLab)


## Copyright
Copyright (c) 2018 Microsoft. All rights reserved.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
