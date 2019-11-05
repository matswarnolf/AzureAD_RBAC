# Det här skriptet skapar en ny resourcegroup och en användare som tilldelas tre roller:
#  - Reader på subscriptionnivå för att låta användaren navigera 
#  - Contributor på ResourceGroup-nivå för att låta användaren jobba med vår resource group
#  - Virtual Machine Operator på Resource-nivå för att hantera VM:ar i resursgruppen






# Check that we are working in the right environment
$Subscription = get-azcontext 
Write-host "$($Subscription.Name)"
read-host “Press ENTER to continue...”

# Skapa användare ------------------------------------------------------
$UserPrincipalName = "rbacdemouser@mfredrikssongmail.onmicrosoft.com"
$ResourceGroupName = "RBAC_DemoGroup"
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "MyStupidDemoPa55w0rd"
$SubscriptionScope = "/subscriptions/$($Subscription.Subscription.id)" 

$UserParameters = @{
    DisplayName       = "RBAC Demo User";
    PasswordProfile   = $PasswordProfile;
    UserPrincipalName = $UserPrincipalName;
    AccountEnabled    = $true;
    MailNickName      = "rbacdemouser"
}
New-AzureADUser @UserParameters

# Skapa Resourcegroup --------------------------------------------------
# Get-AzLocation | select-object -property Location
$location = 'WestEurope'
New-AzResourceGroup -Name $ResourceGroupName -Location $location

# Assign roles for the user in the resource group ----------------------
$ReaderRoleParameters = @{
    SignInName         = $UserPrincipalName;
    RoleDefinitionName = "Reader";
    Scope              = $SubscriptionScope
}

$ContributorRoleParameters = @{
    ResourceGroupName  = $ResourceGroupName;
    RoleDefinitionName = "Contributor";
    SignInName         = $UserPrincipalName
}

$VMoperatorRoleParameters = @{
    ResourceGroupName  = $ResourceGroupName;
    RoleDefinitionName = "Virtual Machine Operator";
    SignInName         = $UserPrincipalName
}

New-AzRoleAssignment @ReaderRoleParameters
New-AzRoleAssignment @ContributorRoleParameters
New-AzRoleAssignment @VMoperatorRoleParameters

# done
