#### Titel:  
#### Date:   
#### Autor: 
#### Keywords:  

--------------------

# Git Repository lokal erstellen

## Projekt Umgebung vorbereiten

#### Erstellen Sie ein Vezeichnis mit dem Name Projekt1

    cd
    mkdir AWS

#### Dateien und Verzeichnisse fuer das Projekt "Statische Webseite"

    touch index.html style.css backend.py backend.js 
    mkdir Secret
    cd Secret
    touch Geheimnisse.txt
    cd ..
    mkdir img
    cd img
    touch aws.jpg dns.jpg ec2-ssh.jpg name.jpg
    cd ..
    touch .gitignore
    
#### Repository clonen 

    git clone https://github.com/volles-kaennchen/AWS
    
#### Falls dass Sie sensibel Daten Verstecken wollen, schreiben Sie welche in .gitignore File und speicher die Aenderungen

    nano .gitignore

Code-Block 

    Secret/
    Bilder/*.png

#### Git Umgebung vorbereiten

    git config --global user.name "Name Nachname"
    git config --global user.email "valid-email"

#### git Kontrollversionierung initialisiren

    git init

#### From Working Area nach Stagin Area nach Repositoty

    git status
    
    git add -A
    git commit -m "Erstes Commit"
    git push 
    git status
    
