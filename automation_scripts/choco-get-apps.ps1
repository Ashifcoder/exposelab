## installation of  chocholotary
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# default apps
choco install sysinternals firefox notepadplusplus winrar 7zip -y


$numOfArgs = $args.Length

if ( $numOfArgs -ne 0 )
{
    for ($i=0; $i -lt $numOfArgs; $i++)
    {
       write-host "[+] Installing $($args[$i])"
       choco install $($args[$i])  -y --no-progress
       
    }
}

else
    {
        Write-Host "[+]Installed Default Apps"
    }
