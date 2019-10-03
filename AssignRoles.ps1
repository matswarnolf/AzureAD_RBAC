# Det här skriptet skapar en ny resourcegroup och en användare som tilldelas två roller:
#  - Reader på subscriptionnivå för att låta användaren navigera 
#  - Contributor på ResourceGroup-nivå för att låta användaren jobba med vår resource group

# TODO Lägg till rätt subscription ID i variablen SubscriptionScope

# Skapa användare ------------------------------------------------------
$UserPrincipalName = "rbacdemouser@example.com"
$ResourceGroupName = "RBAC_DemoGroup"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "MyStupidDemoPa55w0rd"
$SubscriptionScope = "/subscriptions/00000000-0000-0000-0000-000000000000" # ToDo Ändra här

$UserParamameters = @{
    DisplayName       = "RBAC Demo User";
    PasswordProfile   = $PasswordProfile;
    UserPrincipalName = $UserPrincipalName;
    AccountEnabled    = $true;
    MailNickName      = "rbacdemouser"
}
New-AzureADUser $UserParamameters

# Skapa Resourcegroup --------------------------------------------------
# Get-AzLocation | select-object -property Location
$location = 'WestEurope'
New-AzResourceGroup -Name $ResourceGroupName -Location $location

# Assign roles for the user in the resource group ----------------------
$ReaderRoleParameters = @{
    SignInName = $UserPrincipalName;
    RoleDefinitionName = "Reader";
    Scope = $SubscriptionScope
}

$ContributorRoleParameters = @{
    ResourceGroupName = $ResourceGroupName;
    RoleDefinitionName = "Contributor";
    SignInName = $UserPrincipalName
}

New-AzRoleAssignment $ReaderRoleParameters
New-AzRoleAssignment $ContributorRoleParameters