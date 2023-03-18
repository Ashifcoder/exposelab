param
(
    [string]$localAdminpass = 'testpass',
    [string]$domainName = "example.local",
    [string]$domainNetbiosName = "EXAMPLE",
    [string]$safeModePass = "Admin123#",
    [string]$DomainMode = 6,
    [string]$ForestMode = 6
)

echo 'Resetting the Administrator account password and settings...'
Set-LocalUser `
    -Name Administrator `
    -AccountNeverExpires `
    -Password (ConvertTo-SecureString "$localAdminpass" -AsPlainText -Force) `
    -PasswordNeverExpires:$true `
    -UserMayChangePassword:$true


echo '[+] Installing Forest AD'

Install-ADDSForest `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "$DomainMode" `
-DomainName "$domainName" `
-DomainNetbiosName "$domainNetbiosName" `
-ForestMode "$ForestMode" `
-InstallDns `
-LogPath "C:\Windows\NTDS" `
-SysvolPath "C:\Windows\SYSVOL" `
-SafeModeAdministratorPassword (ConvertTo-SecureString "$safeModePass" -AsPlainText -Force) `
-Force