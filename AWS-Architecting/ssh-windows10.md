#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# How to install SSH on Windows 10 without PUTTY..

## Install Feature

    Windows Settings > Apps > Optimal Features > Add Feature: OpenSSH-Client and OpenSSH-Server
    
    <-- if installed continue --> 

## Run Powershell 

    Set-Service sshd -StartupType Automatic
    Set-Service ssh-agent -StartupType Automatic
    
    <-- set auto start, set only if ssh is often used --> 
    <-- otherwise open taskmanager and start the service manually -->
    
-----

    Start-Service sshd
    Start-Service ssh-agent

    Get-Service -Name *ssh* | select DisplayName, Status, StartType

    Get-NetFirewallRule -Name *SSH*
