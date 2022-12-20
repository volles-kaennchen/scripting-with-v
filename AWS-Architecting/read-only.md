#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------


## files 

chmod 0444 /var/www/html/*
chmod 0444 /var/www/html/*.php

## directories

chmod 0444 /var/www/html/
chmod 0444 /path/to/your/dir/

## files and directories

chmod -R 0444 /var/www/html/

## files and directories owned by ftp-data

chown -R ftp-data:ftp-data /var/www/html/
