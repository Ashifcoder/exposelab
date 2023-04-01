param
(
    [string]$password = "pasword123",
    [string]$user = "Administrator",
    [string]$hostname = "localhost_1"
)
Write-Host -ForegroundColor Green "Changing_hostname"
$pass=ConvertTo-SecureString $password -AsPlainText -Force
$cred=New-Object System.Management.Automation.PSCredential ($user, $pass)
Rename-Computer -NewName $hostname -DomainCredential $cred
