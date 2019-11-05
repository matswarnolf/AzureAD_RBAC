
$VM1 = @{
  Name = "ExampleVM1";
  ResourceGroupName = "RBAC_DemoGroup";
  TemplateFile = C:\git\AzureAD_RBAC\VM\template.json;
  TemplateParameterFile = C:\GIT\AzureAD_RBAC\VM\parameters.json
}

New-AzResourceGroupDeployment @VM1