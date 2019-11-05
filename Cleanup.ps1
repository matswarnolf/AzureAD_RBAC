Remove-AzureADUser -ObjectID "rbacdemouser@mfredrikssongmail.onmicrosoft.com" 
Remove-AzResourceGroup -Name "RBAC_DemoGroup" -Force
Get-AzRoleDefinition "Virtual Machine Operator" | Remove-AzRoleDefinition -Force

