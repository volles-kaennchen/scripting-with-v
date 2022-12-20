#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# EC-2 Instance Connection 

## <Step 1> - Connect to EC2 Instance by using AWS EC2 | connect 


## <Step 2> - Prove if httpd is installed

    httpd -v
    
    <-- if command not found - move to step 3 -->


## <Step 3> - Install httpd

    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
    
    <-- if command says "you are not root" - repeat with sudo | sudo su -->
    
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd


## <Step 4> - Prove if httpd is now installed correctly

       httpd -v
       
       <-- if successful it will be list: "Server version: Apache/2.4.54 () | Server built:   Jun 30 2022 11:02:23"


## <Step 5> - Prove ssh 
    
     whoami
    ls -lah
    ls -lah .ssh
    ls -lah /etc /ssh
    
    sudo cp /etc/ssh/sshd_config ssh_config_original 
    sudo vim /etc/ssh/sshd_config
    
    <-- no change need, leave with :q (enter) -->
    
    sudo tail -f /var/log/audit
    sudo tail -f /var/log/amazon 
    man tail 
    sudo tail -f /var/log/secure
    sudo tail /etc/ssh/sshd_configure
    sudo head /etc/ssh/sshd_configure
    sudo tail -f /var/log/secure


## <Step 6> - Start apache web server 

    sudo systemctl status  httpd


## <Step 7> - Proof if apache test page is online

    <-- connect to AWS-EC2 instance | ssh client, part: public DNS - open in new browser tab-->


## <Step 8> - Proof if system is up to date

    sudo yum update & upgrade 
    
--------------------------------------------------------------------------------------------------------
# Create new User using code

## <Step 1> - Create a new user 

    sudo add user testuser
    sudo usermod -aG wheel username
    
    <-- fill the username with your user-->


## <Step 2> - User as sudouser

    sudo nano /etc/sudoers

     <-- go to: #Allows people in  group weel to run all commands -->
     <-- remove # if it is not done yet -->


##  <Step 3> - Create password for the new user

    sudo passwd username 


## <Step 4> - Try login 

    su - username 
    
    <-- enter password -->
