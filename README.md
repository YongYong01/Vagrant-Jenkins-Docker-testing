# TBZM300
Dokumentation Modul 300

## Inhaltsverzeichnis

* 01 - [K1](#k1-)
* 02 - [K2](#k2-)
* 03 - [K3](#k3-)
* 04 - [K4](#k4-)
* 05 - [K5](#k5-)

## K1 <a name="k1"></a>
> [⇧ **Nach oben**](#inhaltsverzeichnis)
### VirtualBox
***
Virtual Box ist eine Virtualisierungssoftware von Oracle. Wir benutzen dieses Programm, um mit Vagrant VMs zu erstellen.

 Oracle VM VirtualBox ist ziemlich einfach, aber auch sehr leistungsfähig. Es kann überall laufen, von kleinen Embedded-Systemen oder Desktop-Computern bis hin zu Rechenzentrumsbereitstellungen und sogar Cloud-Umgebungen. 

Auf jeder einzelnen virtuellen Maschine kann mittels Vagrant bei der automatischen Einrichtung die Software installiert werden.

Auf folgender Seite kann VirtualBox installiert werden: https://www.virtualbox.org/wiki/Downloads

#### Installation
***
1. In den Sicherheitseinstellungen vom Mac muss der Zugriff für VirtualBox erlaubt werden
![Step1VirtualBox](https://i.imgur.com/IOBK5vg.png)

2. Danach geht man normal die Installation durch und wählt den Pfad aus, wo VirtualBox installiert werden soll
![Step2VirtualBox](https://i.imgur.com/pC3cs2i.png)

### Vagrant
***
Vagrant ist ein Tool zum Erstellen und Verwalten von Umgebungen virtueller Maschinen in einem einzigen Workflow.

Vagrant bietet einfach zu konfigurierende Arbeitsumgebungen, die auf  einem einzigen Workflow gesteuert werden, um die Produktivität und Flexibilität eines wiederholendes Vorgehen zu automatisieren.

Auf folgender Seite kann Vagrant installiert werden: https://www.vagrantup.com/downloads.html

#### Installation
***
1. Die Installationsdatei muss ausgewählt und ausgeführt werden.
2. Danach kann man die normale Installation durchführen und wählt den Pfad aus, wo Vagrant installiert werden soll

### Visualstudio-Code
***
Visualstudio Code ist ein Editor für verschiedene Programmiersprachen. Es können Externsions installiert werden, um weitere Sprachen darin zu programmieren.

Mit dem Editor kann man eine beliebige Anzahl von Erweiterungen von Drittanbietern installieren. Während die meisten Szenarien "out of the box" ohne Konfiguration funktionieren, ist es möglich die Programme auf seine eigene individuellen Erlebnisse anzupassen. VS Code ist ein Open-Source-Projekt, so dass man auch vieles auf Github mit beitragen kann.

Auf der folgender Seite kann Visualstudio Code installiert werden: https://code.visualstudio.com/

### SSH-Key für Client erstellt
***
Mittels eines SSH-Keys ist es möglich auf einem Server zuzugreifen. Heute wird das SSH-Protokoll häufig verwendet, um sich von einem System in ein anderes einzuloggen, und seine starke Verschlüsselung macht es ideal, um Aufgaben wie die Ausgabe von Remote-Befehlen und die Remote-Verwaltung der Netzwerkinfrastruktur und anderer wichtiger Systemkomponenten auszuführen. Um das SSH-Protokoll verwenden zu können, müssen einige Softwarekomponenten installiert werden. Dazu führt man folgende Schritte aus.

1. Terminal (Bash) öffnen
2. Folgenden Befehl mit der Account-E-Mail von GitHub einfügen: 
    ```
        ssh-keygen -t rsa -b 4096 -C "beispiel@beispiel.com"
    ```
3. Neuer SSH-Key wird erstellt: 
    ```
        Generating public/private rsa key pair.
    ```
4. Bei der Abfrage, unter welchem Namen der Schlüssel gespeichert werden soll, die Enter-Taste drücken (für Standard): 
    ```
        Enter a file in which to save the key (~/.ssh/id_rsa): [Press enter]
    ```
5. Nun kann ein Passwort für den Key festgelegt werden. Ich empfehle dieses zu setzen und anschliessend dem SSH-Agent zu hinterlegen, sodass keine erneute Eingabe (z.B. beim Pushen) notwendig ist: 
    ```
        Enter passphrase (empty for no passphrase): [Passwort]
        Enter same passphrase again: [Passwort wiederholen]
    ```

Der SSH Key kann im GitHub hinterlegt werden, um Repositorys lokal über eine SSH Verbindung zu klonen

## K2 <a name="k2"></a>
> [⇧ **Nach oben**](#inhaltsverzeichnis)

### GitHub oder Gitlab-Account erstellt
***
Die Leistung von Git sind im Vergleich zu vielen Alternativen sehr stark. Das Einbringen neuer Änderungen, das Branchen, Merging und Vergleichen vergangener Versionen sind leistungsoptimiert.

Um einen GitHub Account zu erstellen, öffnet man die Seite https://github.com/join?source=header-home und folgt dort die einzelnen Steps
1. Username auswählen
2. Eine gültige E-Mailadresse eingeben
3. Passwort eingeben
4. Verifizieren, dass man kein Roboter ist
![GitHubAccountCreation](images/CreateGitHubAccount.png)

### Git-Client wurde verwendet
***
Der Git-Installer kann unter folgender Seite installiert werden: https://git-scm.com/downloads

**Commands**

| Commands | Bedeutung |
| -------------- | -------------- |
| git branch | Mit diesem Befehl listet man alle Branches im eigenem Repo auf. Ebenfalls ist es möglich eigene Branches zu erstellen oder zu dem genannten Branch zu wechseln |
| git checkout | Mit diesem Befehl wechselt man einen Branch |
| git commit | Damit ruft man eine Bestätigung für eine gespeicherte Aktion aus |
| git clone | Mit diesem Befehl klont man lokal ein Repository aus einem Git |
| git add | Mit diesem Befehl kann man eine Datei zum Upload hinzufügen |
| git push | Mit Git Push wird ein Upload bzw. ein Push durchgeführt | 

### Markdown-Editor ausgewählt und eingerichtet
Das Markdown ist eine zusätzliche Extension, um Git Dokumentationen zu schreiben.
Die Extension kann im VisualStudio Codes installiert werden.

Mardown All in One von Yu Zhang
![MarkdownAllInOne](images/MarkdownAllInOne.png)

### Dokumentation ist als Markdown vorhanden
***
Die Dokumentation wurde im VisualStudio Code mit der Extension Markdown All In One geschrieben.
![MarkdownDokumentation](images/MarkdownDokumentaion.png)

## K3 <a name="k3"></a>
> [⇧ **Nach oben**](#inhaltsverzeichnis)

### Bestehende vm aus Vagrant-Cloud einrichten
1. Um die bestehende Vagrant VM zu starten muss man zuerst den Repo vom Modul klonen
    ```
        git clone https://github.com/YongYong01/M300-1.git
    ```
2. Danach exploriert man in das Verzeichnis der VM
    ```
        cd M300/vagrant/web
    ```
3. Die Vagrant VM startet man mit folgendem Befehl
    ```
        vagrant up
    ```
4. Man kann auf die VM per SSH zugreifen
   ```
        vagrant ssh
   ```

### Andere, vorgefertigte vm auf eigenem Notebook aufgesetzt
***
Man kann von der Seite https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=&q= verschiedene VM Boxen herunterladen, um einzelne Vagrantmaschinen zu installieren und einzurichten.
1. Nun kann man im Terminal folgenden Befehl eingeben, um die Debian Box zu installieren
    ```
        vagrant box add debian/jessie64

        Result:
        ==> box: Loading metadata for box 'debian/jessie64'
        box: URL: https://vagrantcloud.com/debian/jessie64
        This box can work with multiple providers! The providers that it
        can work with are listed below. Please review the list and choose
        the provider you will be working with.

        1) libvirt
        2) virtualbox

        Enter your choice: 2
    ```
2. Danach erstellt man ein eigenes Vagrantfile um die VM einzurichten
    ```
        vagrant init debian/jessie64
    ```
3. Zum Schluss kann man auch eigene Konfigurationen mitgeben
    ```
        vi Vagrantfile

        Vagrant.configure("2") do |config|
            config.vm.box = "debian/jessie64"
        end
    ```

### Kennt die Vagrant-Befehle
***

**Commands** 

| Commands | Bedeutung |
| ----- | ----- |
| vagrant box add | fügt vagrant boxen hinzu |
| vagrant box list | listet alle verfügbaren vagrant boxen auf |
| vagrant init | erstellt ein eigenes Vagrantfile |
| vagrant up | erstellt mit dem Vagrantfile die VM | 
| vagrant ssh | man greift mit diesem Befehl auf die Vagrant VM zu (mittels SSH) |
| vagrant halt | stoppt die Vagrant VM |
| vagrant destroy | stoppt und zerstört die Vagrant VM |

### Netzwerkplan
    +------------------------------------------------------------------------------------------------+
    | Netzwerk: 10.0.2.0/24                                                                          |
    |+----------------------------------------------------------------------------------------------+|
    || Hostname: ch-web01                                                                           ||
    || OS: Ubunt  16.04 LTS                                                                         ||
    ||                                                                                              ||
    || LAN enp3s0: 10.0.2.15                                                                        ||
    || Docker docker0: 172.17.0.1                                                                   ||
    || Port: 80, 443, 8080, 8082                                                                    ||
    || NAT: 32760-32780, 80, 8080, 8081, 8082, 3306,                                                ||
    ||                                                                                              ||
    || +-----------------------------------------+      +-----------------------------------------+ ||
    || | Jenkins Container                       |      | Apache Container                        | ||
    || | Ports: 8080, 8082                       |      | Ports: 80, 443, 8081                    | ||
    || | Version: 2.60.3                         |      | Version: 14.04                          | ||
    || | Plugins: git-client, docker-engine      |      | Plugins: -                              | ||
    || |                                         |      |                                         | ||
    || |                                         |      |                                         | ||
    || +-----------------------------------------+      +-----------------------------------------+ ||
    |+----------------------------------------------------------------------------------------------+|        |                                                                                                |
    |+----------------------------------------------------------------------------------------------+|
    || Hostname: ch-db01                                                                            ||
    || OS: Ubunt  16.04 LTS                                                                         ||
    ||                                                                                              ||
    || LAN enp3s0: 10.0.2.16                                                                        ||
    || Docker docker0: 172.17.0.2                                                                   ||
    || Port: 80, 443, 3306                                                                          ||
    || NAT: 32760-32780, 80, 8080, 8081, 8082, 3306,                                                ||
    ||                                                                                              ||
    || +------------------------------------------------------------------------------------------+ ||
    || | MySQL Container                                                                          | ||
    || | Ports: 3306                                                                              | ||
    || | Version: 2.60.3                                                                          | ||
    || | Plugins: -                                                                               | ||
    || |                                                                                          | ||
    || |                                                                                          | ||
    || +------------------------------------------------------------------------------------------+ ||
    |+----------------------------------------------------------------------------------------------+|
    +------------------------------------------------------------------------------------------------+

## K4 <a name="k4"></a>
> [⇧ **Nach oben**](#inhaltsverzeichnis)

### Firewall eingerichtet inkl. Rules
***

*Firewall*

Eine Firewall ist eine Netzwerksicherheitsvorrichtung, die den ein- und ausgehenden Netzwerkverkehr überwacht und entscheidet, ob ein bestimmter Datenverkehr basierend auf einer Sicherheitsregel zugelassen oder blockiert werden soll.

*ufw*

Das Standard-Firewall-Konfigurationstool für Ubuntu ist ufw. ufw wurde entwickelt, um die Konfiguration von iptables Firewalls zu erleichtern und bietet eine benutzerfreundliche Möglichkeit, eine IPv4- oder IPv6-Host-basierte Firewall zu erstellen. Standardmässig ist UFW deaktiviert. UFW steht für Uncomplicatet Firewall, da sie sehr schlicht zu verwalten ist.

**Commands**

| Commands | Bedeutung |
| ----- | ----- |
| ufw status | zeigt den Status der Firewall an |
| ufw enable | Aktiviert die Firewall |
| ufw disable | Deaktiviert die Firewall |
| ufw allow | Öffnet einen Port | 
| ufw deny | Blockiert einen Port |
| ufw reject | Blockiert einen Port ausserhalb (Absender) |

### Reverse-Proxy eingerichtet
***

*Reverse Proxy*
Mit einem Reverse Proxy können Systeme versteckt werden.

### Benutzer- und Rechtevergabe ist eingerichtet
***

*Basics*

Lesen (R): 
Die Leseberechtigung gibt die Befugnisse, eine Datei zu öffnen und zu lesen. Die Leseberechtigung für ein Verzeichnis gibt die Möglichkeit, dessen Inhalt aufzulisten.

Schreiben (W): Die Schreibberechtigung gibt die Befugnisse, den Inhalt einer Datei zu ändern. Die Schreibberechtigung für ein Verzeichnis gibt die Berechtigung, im Verzeichnis gespeicherte Dateien hinzuzufügen, entfernen und umzubenennen. 

Ausführen (X): Unter Unix/Linux kann ein Programm nur ausführt werden, wenn die Ausführungsberechtigung gesetzt ist. Wenn die Ausführungsberechtigung nicht gesetzt ist, kann man den Programmcode möglicherweise nicht nicht ausführen. 

Ordner und Files sind jeweils in drei verschiedenen Berechtigungsgruppen eingeteilt. Der Buchstabe definiert den Dateityp. Die nächsten drei sind die Berechtigung für den File/Directory owner. In der mitte findet man die Berechtigungen für eine definierte Gruppe und die letzten drei Buchstaben bestimmten die Berechtigungen für jeden anderen User auf dem System.

Visuelle Darstellung:

![File/Direcotry Permission Settings](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoRC3ndHT7osbq6wVK2jB1SUBti0JPpYerSzXqJEkvJ2TXDi0Ybg)

*Commands*

| Command | Bedeutung |
| ---- | ---- |
| chmod | Dateirechte anpassen | 
| chown | Dateibesitzer ändern |
| chgrp | Dateigruppe ändern |

### Zugang mit SSH-Tunnel abgesichert
***
### Sicherheitsmassnahmen sind dokumentiert
***
Es existiert eine UFW Firewall, welche alle ungebrauchten Ports blockiert. Für Jenkins und MySQL wurde ein kryptisches Passwort erstellt und zusätzlich User mit Read-Only Berechtigungen.


## K5 <a name="k5"></a>
> [⇧ **Nach oben**](#inhaltsverzeichnis)
### LB2 
***

Mein Ziel ist es eine Automatisierte Containerumgebung mittels Vagrant und Jenkins aufzusetzen. Dazu soll automatisch auf einer VM die benötigten Docker Images installiert und eingerichtet werden. Zusätzlich steht eine MySQL Datenbank bereit auf einer anderen VM, damit die Erweiterungsmöglichkeiten zur Verfügung stehen (OS-Ticket, MyPHPAdmin Interface, etc.)

Es müssen viele Files vorher erzeugt werden, welche zusammenarbeiten müssen und darum würde ich dieses Projekt als "Komplex" einstufen. Da meine Erfahrungen mit Container (Docker) ziemlich frisch sind, ist es auch schwierig die Kombination zwischen Container und Vagrant zu finden. Vagrant habe ich im Modul vorher nur für die Erstellung von VMs genutzt. Nun versuche ich auch komplexere Umgebungen auch miteinzubeziehen.

Das Projekt ist anspruchsvoll, jedoch sind viele Scripts geschrieben mit simplen eingaben. Dies ist jedoch das Ziel - eine komplexe Netzwerkumgebung in einer simplen Containerumgebung umzubauen.

#### Docker Befehle

| Commands | Bedeutung |
| ---- | ---- |
| docker built <Source> | Erstellt ein Docker image |
| docker images | Zeigt alle verfügbare Docker images |
| docker rmi <Image> | Löscht ein Docker image |
| docker run <Image> | startet ein Docker image |
| docker exec -it <Container> /bin/bash | Eploriert ein Container |

### Cloud-Integration
***

Eine Vagrantcloud Umgebumg wurde aufgesetzt.

#### Vagrantfile
Das vollständige Vagrantfile sieht so aus:

    ```
        Vagrant.configure("2") do |config|
            # Jenkins and Apache Virtual Machine
            config.vm.define "web01" do |web01|
                web01.vm.box = "ubuntu/xenial64"
                
                # Portforwarding, Jenkins 8082, http 80, sql 3306
                web01.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
                web01.vm.network "forwarded_port", guest:8081, host:8081, auto_correct: true
                web01.vm.network "forwarded_port", guest:8082, host:8082, auto_correct: true
                web01.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true  
                
                # Enabling a forwarded Portrange for Jenkins
                for i in 32760..32780
                        web01.vm.network :forwarded_port, guest: i, host: i
                end	
                
                # Docker Provisioner (Install image)
                web01.vm.provision "docker" do |d|
                    d.pull_images "ubuntu:14.04"
                end	

                # Hostname
                web01.vm.hostname = "ch-web01"

                # Vagrant Name
                web01.vm.provider "virtualbox" do |v|
                    v.name = "ch-web01"
                end

                #Shell Script Part Updating APT Repository and create Synch Folder
                web01.vm.provision :shell, inline: <<-SHELL
                    sudo apt-get update
                    sudo apt-get -y install apache2
                    mkdir /etc/shared
                    sh /vagrant/scripts/ufw.sh
                    sh /vagrant/scripts/docker_web01.sh
                SHELL
                web01.vm.synced_folder "./shared_web01", "/etc/shared"
                
                # Firewall Configurations
                web01.vm.provision "shell", path: "scripts/ufw.sh"

                # Docker Configurations
                web01.vm.provision "shell", path: "scripts/docker.sh"
            end

            # MySQL Virtual Machine
            config.vm.define "db01" do |db01|
                db01.vm.box = "ubuntu/xenial64"
                
                # Portforwarding, Jenkins 8082, http 80, sql 3306
                db01.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
                db01.vm.network "forwarded_port", guest:8081, host:8081, auto_correct: true
                db01.vm.network "forwarded_port", guest:8082, host:8082, auto_correct: true
                db01.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true  
                
                db01.vm.provision :shell, inline: <<-SHELL
                    sudo apt-get update
                    sudo apt-get -y install apache2
                    sh /vagrant/scripts/docker_db01.sh 
                SHELL
                db01.vm.synced_folder "./shared_db01", "/etc/shared"

                # Docker Provisioner (Install image)
                db01.vm.provision "docker" do |d|
                    d.pull_images "ubuntu:14.04"
                end

                # Hostname
                db01.vm.hostname = "ch-db01"

                # Virtualbox Name
                db01.vm.provider "virtualbox" do |v|
                    v.name = "ch-db01"
                end	
            end
        end
    ```

### Authentifizierung und Autorisierung via LDAP
***


### Übungsdokumentation als Vorlage für Modul-Unterlagen erstellt
*** 
Sehr hilfreich waren die GitHub Dokumentationen und Files, um die Umgebung aufzubauen.

[mc-b M300](https://github.com/mc-b/M300)

### Persönlicher Lernentwicklung
***

Mit diesem Projekt wurde Docker, Vagrant, Virtualbox, MySQL, Jenkins und Apache aufgesetzt. Ich habe für jedes bestimmtes Thema mehr Wissen gewonnen.

*Vagrant*
Mit Vagrant konnte ich mehrere VMs einrichten, welche für Einzelne Jobs zuständig waren. Damit wurden um genauer zu sein, zwei VMs eingerichtet. Eine war für den Webserver und das Jenkins verantwortlich und die andere für die MySQL-Datenbank.

*Virtualbox*
Die VMs wurden in VirtualBox erstellt. Da ich VirtualBox schon auf dem Mac besitze, war die Umsetzung auf dieser Ebene nicht all zu komplex. Jedoch erfuhr ich, wie ich Vagrant mit VirtualBox zusammen einsetzen kann.

*MySQL*
Auf ch-db01 wurde der MySQL Container erstellt. Ich weiss nun, wie ich eine Datenbank in eine einzelnen Container verpacke, anstatt eine eigene Maschine einzurichten.

*Jenkins*
Jenkins ist ein DevOps tool, welches ermöglicht Coninues integration in einer Umgebung einzurichten. Sprich, es können verschiedene DevOps phasen einrichten, um automatisierte Lösungen besser auszurollen. Das Tool wurde auf dem ch-web01 Server eingerichtet. Die Applikation läuft in einem Container. Die Applikation kann geöffnet werden mit dem Port 8082.

    ```
        http://localhost:8083
    ```

*Apache*
Der Webserver wurde auf dem ch-web01 eingerichtet. Die Applikation wurde in einem Container eingerichtet. Die Applikation kann erweitert werden, indem Webseiten noch hinzugefügt werden, von dem man aus alle Applikationen und Container von dort aus verwalten kann. Dazu hatte ich leider nicht genug Zeit. Darum läuft momentan die Standardindexseite von Apache auf Port 8080.

    ```
        http://localhost:8080
    ```

### Vergleich Vorwissen - Wissenszuwachs
***
Ich weiss nun, wie man mittels Vagrant automatisch VMs erstellen kann. Zusätzlich kann ich nun Container auf virtuelle Maschinen erstellen, welche mir ermöglichen Applikationen abzuspalten.
Weiterhin kann ich auch eigene Mikroprozesse erstellen und diese Einsetzen.

### Reflexion
***
Das Projekt konnte auch mir aufzeigen, dass persönlich eine unerforschte Welt der Systemtechnik existiert. Ich finde es gut, dass wir in diesem Modul eine starke Mischung aus skripten und systemverwaltung gelernt haben.
Meine Modularbeit besitzt den Schwerpunkt Automatisation, darum musste ich auch mich wieder in das Skripting vertiefen. Auch wenn ich nicht allzuschwierige Skripte geschrieben habe, hatte ich trotzdem vieles dazugelernt.
Sehr schwierig war es die Dockerfiles richtig einzurichten, da mir dies komplett neu war. Hilfreich waren zudem die einzelnen Bespielen im Modulrepo.

Mir hat das Modul sehr gefallen und ich konnte einiges dazulernen.