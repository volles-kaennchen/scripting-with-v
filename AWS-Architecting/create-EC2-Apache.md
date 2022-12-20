#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Create EC-2 Instance with Apache Web Server 

## <Step 1> - Install cli on arch linux


    pacman -Syu aws-cli


## <Step 2> - Cli lookup


    aws --version


## <Step 3> - Create aws access key on IAM

    <!-- must be on the same folder location -->


## <Step 4> - Configure aws


    AWS Access Key ID [None]:             <!-- enter from IAM below -->
    
    AWS Secret Access Key [None]:         <!-- enter from IAM below -->
    
    Default region name [eu-central-1]: eu-central-1
    
    Default output format [json]: json


## <Step 5> - Configure data

    aws configure list
    
    <!-- proof if accesskeys exist -->


## <Step 6> - Ami-id lookup


    aws ec2 describe-images --owners amazon --filters "Name=name, Values=amzn2-ami-hvm-2.0.????????.?-x86_64-gp2" "Name=state, Values=available" --query "reverse(sort_by(Images, &Name))[:1].ImageId" --output text                         
    
    <!-- output ami-0b920b05XXXXXXX... | save for later! -->
    

## <Step 7> - Create key pair 


    aws ec2 create-key-pair --key-name Apache-Web-Server --query 'KeyMaterial' --output text > Apache-Web-Server.pem


## <Step 8> - Keypair lookup


    aws ec2 describe-key-pairs --key-name Apache-Web-Server


## <Step 9> - Create security group 


    aws ec2 create-security-group --group-name Apache-Web-Server-SG --description "Allows SSH and HTTP connections for the Web Server"

    <!-- output sg-0bd573211XXXXXX... | save for later! -->


## <Step 10> - Add security group rules 


    aws ec2 authorize-security-group-ingress --group-id sg-0bd573211XXXXXX... --protocol tcp --port 22 --cidr 0.0.0.0/0
    
    <!-- port 22 for SSH | "--cidr" leave it open with 0 or add public IP address -->


    aws ec2 authorize-security-group-ingress --group-id sg-0bd573211XXXXXX... --protocol tcp --port 80 --cidr 0.0.0.0/0
    
    <!-- port 80 HTTP | "--cidr" leave it open with 0 or add public IP address -->
  
  
## <Step 11> - Security lookup

    aws ec2 describe-security-groups --group-ids sg-0bd573211XXXXXX...
    
    
## <Step 12> - Prepare webscript.sh

    <!--must be on the same folder location -->
    
        #!/bin/bash
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd


## <Step 13> - Create EC2 instance


    aws ec2 run-instances --image-id ami-0b920b05XXXXXXX... --count 1 --instance-type t2.micro --key-name Apache-Web-Server --security-group-ids sg-0bd573211XXXXXX... --user-data file:/webscript.sh


## <Step 14> - EC2 lookup on AWS - EC2 instance

    <!-- name instance by klick following Symbol: --> 
    
![](https://github.com/volles-kaennchen/AWS/blob/master/name.jpg)


    <!-- instance status "pending" -->


## <Step 15> - EC2 lookup


    aws ec2 describe-instances
    
    <!-- output "PublicIpAddress" save for later! -->


## <Step 16> - Connect to instance by using kitty (2 ways)

    <!-- connect to AWS-EC2 instance | ssh client -->

![](https://github.com/volles-kaennchen/AWS/blob/master/ec2-ssh.jpg)

    chmod 400 Apache-Web-Server.pem
    kitty +kitten ssh -i "Apache-Web-Server.pem" ec2-user@ec2XXXXXXXXXXXXXXX.eu-central-1.compute.amazonaws.com
    
    
    chmod 400 Apache-Web-Server.pem
    kitty +kitten ssh -i "Apache-Web-Server.pem" ec2-user@54.162.XXX.XXX
    
    <!-- add PublicIpAddress from EC2 lookup -->


## <Step 17> - Apache web server lookup (2 ways)

    <!-- connect to AWS-EC2 instance | ssh client, part: public DNS -->
    
![](https://github.com/volles-kaennchen/AWS/blob/master/dns.jpg)
    
    ec2XXXXXXXXXXXXXXX.eu-central-1.compute.amazonaws.com


    sudo systemctl status httpd
    
    <!-- output ec2-user@ip-XXX.XX.XX.XXX | save for later! -->
