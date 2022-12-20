#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Install Docker on Amazon Linux AMI

### First of all.. The requirement is an existing AWS account.

## <Step 1> - Create a new fresh and clean Instance

**Note that it is not necessary to do this via aws portal. You can also run the creation local via script.**

## Login to AWS, go to EC2 "Launch Instance" 

            AMI Linux 64bit | t2.micro
            Name Instance:        Name-DockerOnLinuxAMI
            Name Security Group:  HTTP 80 Anywhere + SSH 22 Anywhere
            Name KeyPair:         Name-Key-DockerOnLinuxAMI (.pem)
            
    
## <Step 2> - Set the Key File to READ-ONLY 
    
    chmod 400 Downloads/Name-Key-DockerOnLinuxAMI.pem
    
## <Step 3> - Login to Instance 
     
    ssh -i Name-Key-DockerOnLinuxAMI.pem ec2-user@ecXXXXXXXXX.compute-1.amazonaws.com
    exit 
    
## <Step 4> - Check if ~/.ssh exist

    ls-lah
    cd ~/.ssh/config

    <-- if exist skip Step 5, continue Step 6 -->

## <Step 5> - Generate ~/.ssh exist
          
    mkdir -p ~/.ssh && chmod 700 ~/.ssh
    touch  ~/.ssh/config
    chmod 600 ~/.ssh/config
  
## <Step 6> - Create "SSH AMI" 
        
        nano  ~/.ssh/config
  
### Join nano and enter script
  
    Host ami
      Hostname      ec2-user@ecXXXXXXXXX.compute-1.amazonaws.com
      User          ec2-user
      IdentityFile ~/.ssh/Name-Key-DockerOnLinuxAMI.pem
  
      <-- replace with your data -->

## <Step 7> - Move File 

    mv ~/Downloads/Name-Key-DockerOnLinuxAMI.pem ~/.ssh/
       
## <Step 8> - Try login with to Instance with command 
  
    ssh ami 
    
## <Step 9> - Check for Updates 
  
    sudo yum update 

## <Step 10> - Quick Docker Install
  
    sudo yum install -y docker
    docker -v
    sudo service docker start
    ps aux|grep docker
    sudo service docker status
