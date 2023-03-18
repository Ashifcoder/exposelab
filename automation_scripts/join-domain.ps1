param
(
    [string][ValidateNotNullOrEmpty()]$Password = "testpass123",
    [string]$user = "testuser",
    [string]$domain = "example.local"
)


Write-Host -ForegroundColor Green "Joining Active Directory domain. . ."

# Create password as secure string
$pass=ConvertTo-SecureString $Password -AsPlainText -Force

# Create credential object
$Credential = New-Object System.Management.Automation.PSCredential ($user, $pass)

# Join domain
$Settings = @{
    DomainName       = $domain
    DomainCredential = $Credential
}

Add-Computer @Settings