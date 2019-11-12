set-location C:\git\AzureAD_RBAC\

# show roles in AzureRBAC
Get-AzRoleDefinition | Select-Object -Property Name,Description
Get-AzRoleDefinition -Custom

# how Operations
Get-AzProviderOperation "Microsoft.Compute/virtualMachines/*" | Select-Object -Property Operation,OperationName,Description | Format-Table
Get-AzProviderOperation "Microsoft.Insights/alertRules/*" | Select-Object -Property Operation,OperationName,Description | Format-Table
Get-AzProviderOperation "Microsoft.Storage/*/read" | Select-Object -Property Operation,OperationName,Description | Format-Table
Get-AzProviderOperation "Microsoft.Resources/subscriptions/resourceGroups/*" | Select-Object -Property Operation,OperationName,Description | Format-Table

# Show the custom role definition


#  Create the role

New-AzRoleDefinition -InputFile .\CustomRole.json

Get-AzRoleDefinition -Name "Virtual Machine Operator"



