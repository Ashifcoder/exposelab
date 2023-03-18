param
(
    [string][ValidateNotNullOrEmpty()]$Password = "testpass123",
    [string]$localAdminpass = 'testpass',
    [string]$user = "testuser",
    [string]$dcip = '127.0.0.1',
    [string]$domain = "example.local",
    [string]$safeModePass = "Admin123#",
    [string]$childName = 'child',
    [string]$DomainMode = 6
)
Write-Host -ForegroundColor Green "Installing the AD services and administration tools..."

# Configure DNS to point to parent DC
$adapters = Get-WmiObject Win32_NetworkAdapterConfiguration
if ($adapters) {
    $adapters | ForEach-Object {$_.SetDNSServerSearchOrder($dcip)}
}


echo 'Resetting the Administrator account password and settings...'
Set-LocalUser `
    -Name Administrator `
    -AccountNeverExpires `
    -Password (ConvertTo-SecureString "$localAdminpass" -AsPlainText -Force) `
    -PasswordNeverExpires:$true `
    -UserMayChangePassword:$true

Install-WindowsFeature AD-Domain-Services,RSAT-AD-AdminCenter,RSAT-ADDS-Tools


# Create password as secure string
$pass=ConvertTo-SecureString $Password -AsPlainText -Force
$name = $user+'@'+$domain
$Credential = New-Object System.Management.Automation.PSCredential ($name, $pass)
# promoting the server 
Write-Host -ForegroundColor Green "Making the child domain.. (be patient, this will take more than 30m to install)"


# new fqdn of child domain

$new_childDomain = $childName + '.' + $domain

echo $new_childDomain

Start-Sleep -s 120  #change it to 3 min 

Install-ADDSDomain `
-NoGlobalCatalog:$false `
-CreateDnsDelegation:$true `
-SafeModeAdministratorPassword (ConvertTo-SecureString "$safeModePass" -AsPlainText -Force) `
-Credential ($credential) `
-DatabasePath "C:\Windows\NTDS" `
-DomainType "ChildDomain" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NewDomainName $childName `
-NewDomainNetbiosName $childName.ToUpper() `
-ParentDomainName $domain `
-DomainMode $DomainMode `
-NoRebootOnCompletion:$true `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

# make sure all the other services are running on the server

# Get-Services adws,kdc,Netlogon,dns
# Get-Smbshare

