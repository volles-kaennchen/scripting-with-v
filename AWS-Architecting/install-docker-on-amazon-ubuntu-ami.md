#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Install Docker on Ubuntu AMI

### First of all.. The requirement is an existing AWS account.

## <Step 1> - Create a new fresh and clean Instance

**Note that it is not necessary to do this via aws portal. You can also run the creation local via script.**

## Login to AWS, go to EC2 "Launch Instance" 

            AMI Ubuntu 64bit | t2.micro
            Name Instance:        Name-DockerOnUbuntuAMI
            Name Security Group:  HTTP 80 Anywhere + SSH 22 Anywhere
            Name KeyPair:         Name-Key-DockerOnUbuntuAMI (.pem)
            
            Advanced Settings > User Data choose "as text" add: #include https://get.docker.com
    
        <-- "https://get.docker.com" will create the service lxc-docker and docker group -->
        
## <Step 2> - Set the Key File to READ-ONLY 
    
    chmod 600 Downloads/Name-Key-DockerOnUbuntuAMI.pem
    
## <Step 3> - Login to Instance 
     
    ssh -i Name-Key-DockerOnUbuntuAMI.pem ubuntu@ecXXXXXXXXX.compute-1.amazonaws.com
    exit  

## <Step 4> - Quick Docker Install
  
    sudo apt-get update
    sudo apt-get install docker.io 
    
    source /etc/bash_completiotion.d/docker.io
    
    service docker.io status 
    service docker.io starten
 
 ## ROOT 
 
    sudo usermod -aG docker k

