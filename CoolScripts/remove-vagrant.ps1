#-----------Munuall Command to run -----------

# Write Manually to disable the network of vagrant
Write-Host -ForegroundColor Green [-] Disabling the vagrent Network on the machine [-]
Get-NetAdapter ; Disable-NetAdapter -Name 'Ethernet' -Confirm:$False ; Write-Host -ForegroundColor Green "[+] Enabled" ; Get-NetAdapter

# Write Manually to remove the vagrant user from the system
Write-Host -ForegroundColor Green [-] Removing Vagrant User [-] 
Remove-LocalUser -Name 'vagrant'