
Import-Module AzureADPreview
Import-Module Az
$cred=get-credential
Connect-AzAccount -Credential $cred
connect-azuread -tenant b91f4433-61c4-45b8-8d58-d80dc613008b -Credential $cred

