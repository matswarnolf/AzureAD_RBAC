set-location C:\git\AzureAD_RBAC\
Get-AzRoleDefinition | Select-Object -Property Name,Description
Get-AzRoleDefinition -Custom
Get-AzProviderOperation "Microsoft.Compute/virtualMachines/*" | Select-Object -Property Operation,OperationName,Description | Format-Table
Get-AzProviderOperation "Microsoft.Insights/alertRules/*" | Select-Object -Property Operation,OperationName,Description | Format-Table
Get-AzProviderOperation "Microsoft.Storage/*/read" | Select-Object -Property Operation,OperationName,Description | Format-Table
Get-AzProviderOperation "Microsoft.Resources/subscriptions/resourceGroups/*" | Select-Object -Property Operation,OperationName,Description | Format-Table

New-AzRoleDefinition -InputFile .\CustomRole.json

Get-AzRoleDefinition -Name "Virtual Machine Operator"



