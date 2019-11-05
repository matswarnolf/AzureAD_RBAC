
$SecurePassword = (ConvertTo-SecureString $PasswordProfile.Password -AsPlainText -Force) 
$VM1 = @{
  Name                  = "DemoDeployment";
  ResourceGroupName     = "RBAC_DemoGroup";
  TemplateFile          = "C:\git\AzureAD_RBAC\VM\template.json";
  TemplateParameterFile = "C:\GIT\AzureAD_RBAC\VM\parameters.json"
}

New-AzResourceGroupDeployment @VM1