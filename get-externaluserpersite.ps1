import-module Microsoft.Online.SharePoint.PowerShell
$cred = get-credential
$orgName = "foba"
$ExternalUsers = @{ }
Connect-SPOService -Url "https://$orgname-admin.sharepoint.com" -Credential $cred
$sites = get-sposite -Limit All
#get all external users by running
foreach ($site in $sites) {
    $SiteUsers = get-spoexternaluser -SiteUrl $site.url
    Foreach ($ExternalUser in $SiteUsers) {
        $Guest = [Ordered] @{
            'URL'         = $Site.URL;
            'Site'        = $Site.Title;
            'DisplayName' = $ExternalUser.DisplayName;
            'Email'       = $ExternalUser.Email;
            'Created'     = $ExternalUser.WhenCreated
        }
        $GuestUser = New-Object -TypeName psobject -Property $Guest
        $ExternalUsers.Add("$GuestUser")
    }
    
}

