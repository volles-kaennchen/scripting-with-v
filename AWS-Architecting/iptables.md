#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


## Install iptables (ubuntu)
    sudo apt-get install iptables
    
## Install iptables (CentOS)

    <-- iptables has been replaced by firewalld -->
    
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
    sudo systemctl disable firewalld
    
    sudo yum -y install iptables-services
    
    sudo systemctl enable iptables
    sudo systemctl start iptables
    
    sudo systemctl status iptables

    <-- keep in mind, there are different iptables for ipv4 and ipv6 -->
    
## Check status

    sudo iptables -L

    <-- output: -->
    <-- Chain INPUT (policy ACCEPT) -->
    <-- Chain FORWARD (policy ACCEPT) -->
    <-- Chain OUTPUT (policy ACCEPT) -->

## Activate loopback 

    sudo iptables -A INPUT -i lo -j ACCEPT


## Set port rules for http, ssh, https

    sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Controll traffic by ip-address

## Port freigeben, verbieten | adresspool verbieten 

    sudo iptables -A INPUT -s 192.xxx.x.xx -j ACCEPT
     <-- sudo iptables -A INPUT -j ACCEPT -->
     
    sudo iptables -A INPUT -s 192.xxx.x.xx -j DROP 
    <-- sudo iptables -A INPUT -j DROP -->
    
    sudo iptables -A INPUT -m iprange --src-range 192.xxx.x.x-192.xxx.x.xxx -j REJECT

## firewall

    sudo iptables -L --line-numbers
    <-- list all rules -->
    
    sudo iptables -D INPUT Number
    <-- replace number -->

# save firewall rules 

## Retain rules after restart (Debian)
    sudo /sbin/iptables–save
    
## Retain rules after restart (ubuntu)
    sudo apt-get install iptables-persistent
    
## firewallrules (red hat)
    sudo /sbin/service iptables save
    <-- will be retain rules after restart automaticaly -->
   
    
