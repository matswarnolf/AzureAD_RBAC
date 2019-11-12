set-location C:\git\AzureAD_RBAC\
Get-AzRoleDefinition -Custom
Get-AzProviderOperation "Microsoft.Compute/virtualMachines/*" | Format-list
Get-Content .\CustomRole.json
New-AzRoleDefinition -InputFile .\CustomRole.json
Get-AzRoleDefinition -Name "Virtual Machine Operator"



