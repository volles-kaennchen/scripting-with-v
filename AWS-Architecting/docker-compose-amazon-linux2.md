#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


## Download Docker Compose 

    wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)


## Move File

    sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose


## Permission

    sudo chmod -v +x /usr/local/bin/docker-compose

## Verify installation

    docker-compose version
