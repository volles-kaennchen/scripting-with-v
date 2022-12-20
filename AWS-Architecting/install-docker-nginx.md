#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


# Install Docker without Cloud9 | Run Docker Container on Linux

## <Step 1> - Connect to EC2 Instance with SSH

## <Step 2> - Install Docker

	sudo yum install docker -y
	docker --version
	sudo systemctl enable docker
	sudo systemctl start docker

	sudo systemctl status docker

	
## <Step 3> - Install Wordpress

	ip addr
	<-- output local ip address | save for later -->
	
	sudo docker run hello-world
	sudo ufw status
	
	sudo docker run --name ENTERNAME-wordpress -p 8080:80 -d wordpress
	sudo docker ps
	<-- output http://localhost:8080 -->


## <Step 4> - Prepare Netdata
	
	sudo docker ps -a
	
	sudo nano /etc/ssh/sshd_config
	<-- remove the # from Port 22 | save and exit nano -->
	
	sudo systemctl restart sshd


## <Step 5> - Create Netdata
	
	touch netdata.txt
	nano netdata.txt
	
	sudo docker ps
	
		docker run -d --name=netdata \
		-p 19999:19999 \
		-v /etc/passwd:/host/etc/passwd:ro \
		-v /etc/group:/host/etc/group:ro \
		-v /proc:/host/proc:ro \
		-v /sys:/host/sys:ro \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		--cap-add SYS_PTRACE \
		--security-opt apparmor=unconfined \
		netdata/netdata

		
## <Step 6> - Install netdata

		sudo docker run -d --name=netdata \
		-p 19999:19999 \
		-v /etc/passwd:/host/etc/passwd:ro \
		-v /etc/group:/host/etc/group:ro \
		-v /proc:/host/proc:ro \
		-v /sys:/host/sys:ro \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		--cap-add SYS_PTRACE \
		--security-opt apparmor=unconfined \
		netdata/netdata

 	
	sudo docker ps
	<-- output http://localhost 19999 -->


## <Step 7> - Start | Stop Docker using ID

	sudo docker stop IDxxx..
	sudo docker start IDxxxx..


## <Step 8> - Docker location lookup

	sudo systemctl docker.service
	which docker

------------------------------------

# Install Docker Portainer on Linux using nginx Manager

## <Step 1> - Create folder 

	mkdir portainer
	cd portainer
	
	nano docker-compose.yaml


## <Step 2> - Add Script 

		sudo docker-compose up -d
		sudo docker-compose down --remove-orphans
		sudo docker-compose up -de


## <Step 3> - Create folder 

	mkdir wordpress
	cd wordpress

	nano docker-compose.yaml


## <Step 4> - Add Script 

		version: '2.3'
		services:
		  nginx-proxy:
			image: jwilder/nginx-proxy
			restart: always
			volumes:
			  - ./nginx-proxy/nginx-proxy-certs:/etc/nginx/certs:ro
			  - ./nginx-proxy/nginx-proxy-vhost:/etc/nginx/vhost.d
			  - /usr/share/nginx/html
			  - /var/run/docker.sock:/tmp/docker.sock:ro
			ports:
			  - 80:80
			  - 443:443
			labels:
			  - "com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy"
			networks:
			  wp-network:
		  nginx-letsencrypt:
			image: jrcs/letsencrypt-nginx-proxy-companion
			restart: always
			volumes:
			  - ./nginx-proxy/nginx-proxy-certs:/etc/nginx/certs:rw
			  - /var/run/docker.sock:/var/run/docker.sock:ro
			volumes_from:
			  - nginx-proxy
			networks:
			  wp-network:
		  wpdb:
			image: mariadb:10.5.4
			restart: always
			environment:
			  - MYSQL_ROOT_PASSWORD=xxxx                    
			  - MYSQL_DATABASE=xxxx                           
			  - MYSQL_USER=xxxx                                
			  - MYSQL_PASSWORD=xxxx                      
			volumes:
			  - ./wordpress-db/wpdb-data:/var/lib/mysql
			networks:
			  wp-network:
		  wp:
			depends_on:
			  - wpdb
			image: wordpress:latest
			volumes:
			  - ./wordpress/wp-data:/var/www/html/wordpress
			ports:
			  - "8080:80"
			restart: always
			environment:
			  - WORDPRESS_DB_HOST=xxxx
			  - WORDPRESS_DB_USER=xxxx              
			  - WORDPRESS_DB_NAME=xxxx          
			  - VIRTUAL_HOST=xxxx                
			  - VIRTUAL_PORT=80
			  - VIRTUAL_PROTO=http
			  - LETSENCRYPT_HOST=xxxx 			<-- add from: ip addr -->              
			  - LETSENCRYPT_EMAIL=xxxx          
			  - RESOLVE_TO_PROXY_IP=true
			networks:
			  wp-network:
		networks:
		  wp-network:
			driver: bridge
		volumes:
		  nginx-proxy-certs:
		  nginx-proxy-vhost:
		  nginx-proxy-certs:
		  wpdb-data:
		  wp-data:

## <Step 5> - Stop Docker 
	sudo docker ps 
	<-- output docker ID| save for later -->
	
	sudo docker stop ID 
	sudo docker-compose up -d
	
	<-- output link | save -->
