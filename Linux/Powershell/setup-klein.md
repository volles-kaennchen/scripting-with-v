# Einen DomainController vorbereiten: 
## Festlegen einer IP Adresse

   New-NetIPAddress "IPADRESSE HIER EINFÜGEN" -PrefixLength 16 -InterfaceAlias Ethernet

## Festlegen des DNS Servers

  Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 127.X.X.X

## Umbennen des Servers

  Rename-Computer DC1 -Force -Restarthostname

## Name des Host abfragen

  hostname

## Tools und Features installieren

  Install-WindowsFeature AD-Domain-Services,DNS
  Install-ADDSForest -DomainName 'DOMAINEHIEREINFÜGEN' -SafeModeAdministratorPassword ( ConvertTo-SecureString -AsPlainText -Force 'Pa$$w0rd' ) -Force


# Einen Client vorbereiten
## Client konfigurieren

  New-NetIPAddress 172.16.0.100 -PrefixLength 16 -InterfaceAlias Ethernet
  Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 172.XX.X.XX
  Rename-Computer CL1 -Force -Restart
  Add-Computer -DomainName 'DOMAINEEINFÜGEN' -Restart

  cd HKLM:\SOFTWARE\Microsoft\WebManagement\Server\
  
  dir
  
  gci -r
  
  Set-Service -Name WMSVC -StartupType Automatic
  
  Start-Service WMSVC
  
  ls
  
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WebManagement\Server" -Name EnableRemoteManagement -value 1 -type Dword
  
  ls

  dir *.msc
  
  cd CERT:
  
  dir
  
  certmgr.msc
