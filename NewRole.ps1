Connect-AzAccount

Get-AzRoleDefinition -Custom
New-AzRoleDefinition -InputFile .\CustomRole.json
Get-AzRoleDefinition -Name "Virtual Machine Operator"


Get-AzRoleDefinition "Virtual Machine Operator" | Remove-AzRoleDefinition
