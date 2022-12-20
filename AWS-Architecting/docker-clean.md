#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


## <Step 1> - Remove AWS Cloud9 files from container
        
        sudo rm -r ~/.c9
        
## <Step 2> - Remove Docker Container

        sudo docker stop cloud9
        sudo docker rm cloud9
        
## <Step 3> - Remove Docker image 
        
        sudo docker image rm cloud9-image:latest
        
## <Step 4> - Remove hidden Docker files

        sudo docker system prune -a

## <Step 5> - Uninstall Docker Linux/Ubuntu

            sudo yum -y remove docker
            sudo apt -y remove docker
    
## <Step 6> - Remove Dockerfile + Authorized Key

        sudo rm /tmp/Dockerfile
        sudo rm /tmp/authorized_keys
