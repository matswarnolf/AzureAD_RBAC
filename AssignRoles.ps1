# Skapa användare ------------------------------------------------------
$UserPrincipalName = "rbacdemouser@example.com"
$ResourceGroupName = "RBAC_DemoGroup"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "Password"
$UserParamameters = @{
    DisplayName       = "RBAC Demo User";
    PasswordProfile   = $PasswordProfile;
    UserPrincipalName = $UserPrincipalName;
    AccountEnabled    = $true;
    MailNickName      = "rbacuser"
}

New-AzureADUser $UserParamameters

# Skapa Resourcegroup --------------------------------------------------
# Get-AzLocation | select-object -property Location
$location = 'WestEurope'
New-AzResourceGroup -Name $ResourceGroupName -Location $location

# Assign roles for the user in the resource group ----------------------
$SubsriptionScope = "/subscriptions/00000000-0000-0000-0000-000000000000"
$ReaderRoleParameters = @{
    SignInName = $UserPrincipalName;
    RoleDefinitionName = "Reader";
    Scope = $SubsriptionScope
}

$ContributorRoleParameters = @{
    ResourceGroupName = $ResourceGroupName;
    RoleDefinitionName = "Contributor";
    SignInName = $UserPrincipalName
}

New-AzRoleAssignment $ReaderRoleParameters
New-AzRoleAssignment $ContributorRoleParameters