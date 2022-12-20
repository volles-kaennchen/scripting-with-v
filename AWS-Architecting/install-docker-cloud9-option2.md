#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Install Docker using Cloud9 and Apache Web Server

##Open the Cloud9 IDE on the AWS - Cloud9 Panel. Connect to EC2 Instance with SSH.

## <Step 1> - Install Docker

        docker --version
        sudo yum install -y docker
        sudo apt install -y docker.io
        sudo service docker start
        sudo docker info

## <Step 2> - Build Image

        sudo touch /tmp/Dockerfile

### Content Docker File

            # Build a Docker image based on the Amazon Linux 2 Docker image.
            FROM amazonlinux:2

            # install common tools
            RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
            RUN yum update -y
            RUN yum install -y sudo bash curl wget git man-db nano vim bash-completion tmux  gcc gcc-c++ make tar

            # Enable the Docker container to communicate with AWS Cloud9 by
            # installing SSH.
            RUN yum install -y openssh-server

            # Ensure that Node.js is installed.
            RUN yum install -y nodejs

            # Create user and enable root access
            RUN useradd --uid 1000 --shell /bin/bash -m --home-dir /home/ubuntu ubuntu && \
                sed -i 's/%wheel\s.*/%wheel ALL=NOPASSWD:ALL/' /etc/sudoers && \
                usermod -a -G wheel ubuntu

            # Add the AWS Cloud9 SSH public key to the Docker container.
            # This assumes a file named authorized_keys containing the
            # AWS Cloud9 SSH public key already exists in the same
            # directory as the Dockerfile.
            RUN mkdir -p /home/ubuntu/.ssh
            ADD ./authorized_keys /home/ubuntu/.ssh/authorized_keys
            RUN chown -R ubuntu /home/ubuntu/.ssh /home/ubuntu/.ssh/authorized_keys && \
            chmod 700 /home/ubuntu/.ssh && \
            chmod 600 /home/ubuntu/.ssh/authorized_keys

            # Update the password to a random one for the user ubuntu.
            RUN echo "ubuntu:$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" | chpasswd

            # pre-install Cloud9 dependencies
            USER ubuntu
            RUN curl https://d2j6vhu5uywtq3.cloudfront.net/static/c9-install.sh | bash

            USER root
            # Start SSH in the Docker container.
            CMD ssh-keygen -A && /usr/sbin/sshd -D
   --------------------------------------------------
   
    
            sudo vi /tmp/Dockerfile
            <-- tab i fpr insert, then place content likje step above -->
            <-- left with :wq enter -->

            sudo touch /tmp/authorized_keys

## <Step 3> - Build image

                sudo docker build -t cloud9-image:latest /tmp

                <-- should end with successfully --->

                sudo docker image ls

                curl http://169.254.169.254/latest/meta-data/public-ipv4
                <-- output ip-address | save for later -->

## <Step 4> - Run Docker Container

                sudo docker run -d -it --expose 9090 -p 0.0.0.0:9090:22 --name cloud9 cloud9-image:latest
                sudo docker container ls
                sudo docker exec -it cloud9 bash
                sudo chmod u=rwx,g=rx,o=rx ~
                which node

### create new environment

                <-- new env with (name/desc of your choice)-->
                <-- env type = connect and run remote server | public ssh key -->
                <-- user ubuntu | port 9090 | advanced > node.js - place path of running docker -->
                <-- aws cloud9 install... clear c9.ide.lambda.docker | next, next, finish-->

## <Step 6> - Run code

                <-- cloud9 env | workspace/server.js - run -->
                <-- cloud9 env | workspace/client/index.html - Tool, Preview, Preview Running Application -->
                <-- enter name and message | send -->








    
    
