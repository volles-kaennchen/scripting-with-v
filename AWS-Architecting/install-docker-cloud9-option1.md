#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Install Docker using Cloud9 and Apache Web Server

## Open the Cloud9 IDE on the AWS - Cloud9 Panel. Connect to EC2 Instance with SSH.


## <Step 1>       - Install docker
    
    sudo yum install docker -y


## <Step 2>       - Check if docker is installed
 
    docker --version
    <-- output: Docker version and build id | save for later -->
 
 
## <Step 3>       - Check if docker is active
    
    sudo systemctl status docker
    <-- if status: dead | continue with step 4 --> 


## <Step 4>       - Activate docker (only if necessary)

    sudo systemctl enable docker
    sudo systemctl start docker
    
    sudo systemctl status docker
    
    sudo docker info


## <Step 5>       - Check ip adress

    ip addr 
    <-- output ip adress list | save ip adress list as docker0
  
  
## <Step 6>       - Recall docker - linux contrainer

    sudo docker run hello-world
    <-- should end with "pull complete" | Hello from Docker -->


## <Step 7>       - Check for update 

    sudo yum update -y


## <Step 8>       - Install mariadb | on Cloud9 IDE > open new terminal >

    sudo yum install -y mariadb-server
    sudo systemctl start mariadb

    sudo mysql_secure_installation
    <-- press enter (cause no root password given) | than create new password | enter the common questions with /n --> 
    <-- end with "Thanks for using Mariadb" -->


## <Step 9>       - Open mysql 

    sudo mysql -u root -p
    <-- root pw /y | enter root password created step above | MariaDB [(none)]> will be open-->


## <Step 10>      - Create database

    create database wp_test 
    grant all privileges on wp_test.* to wp_user@localhost identified by 'YourSecurePassword';
    <-- if 1 row affected and grant done | end with command: exit --> 


## <Step 11>      - Prepare folder/file

    cd /home/ec2-user/environment

    mkdir config
    mkdir wordpress

    cd home/ec2-user/environment/config
    touch wordpress.conf

    cd /home/ec2-user/environment/wordpress
    touch wp-config-sample.php


## <Step 12>       - update "wordpress.conf"
    
    cd /home/ec2-user/environment/conf
    nano wordpress.conf
    
    <-- Ensure that Apache listens on port 80 -->

    Listen 8080
    <VirtualHost *:8080>
        DocumentRoot "/var/www/wordpress"
        ServerName www.example.org
        # Other directives here
    </VirtualHost> 


## <Step 13>       - retrieve archive file wordpress

    cd /home/ec2-user/environment
    
    wget https://wordpress.org/latest.tar.gz
    tar xvf latest.tar.gz
    
    <-- end with "‘latest.tar.gz’ saved" -->
  
  
## <Step 14>       - update "wp-config-sample.php"

    cd /home/ec2-user/environment/wordpress
    nano wp-config-sample.php

    // ** MySQL settings - You can get this info from your web host ** //
    /** The name of the database for WordPress */
    define( 'DB_NAME', 'wp_test' );

    /** MySQL database username */
    define( 'DB_USER', 'wp_user' );

    /** MySQL database password */
    define( 'DB_PASSWORD', 'YourSecurePassword' );

    /** MySQL hostname */
    define( 'DB_HOST', 'localhost' );

    /** Database Charset to use in creating database tables. */
    define( 'DB_CHARSET', 'utf8' );

    /** The Database Collate type. Don't change this if in doubt. */
    define( 'DB_COLLATE', '' );

    define('FORCE_SSL', true);

    if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS'] = 'on';


## <Step 15>         - check if apache is installed 

    httpd -v

    <-- if not installed do: -->
    sudo yum install -y httpd 


## <Step 16>         - move file 

    cd /etc/httpd/conf.d
    sudo ln -s /home/ec2-user/environment/config/wordpress.conf 


    cd /var/www
    sudo ln -s /home/ec2-user/environment/wordpress
    sudo chmod +x /home/ec2-user/


## <Step 17>         - allow apache to run script

    sudo chmod +x /home/ec2-user/


## <Step 18>         - restart apache server

    sudo service httpd restart


## <Step 19>         - prepare web content

    cd /home/ec2-user/environment/wordpress
    touch index.html 
    nano index.html
