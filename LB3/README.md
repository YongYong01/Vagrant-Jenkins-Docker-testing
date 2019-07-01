# TBZM300
Dokumentation Modul 300

## Inhaltsverzeichnis

* 01 - [K1](#k1-)
* 02 - [K2](#k2-)
* 03 - [K3](#k3-)
* 04 - [K4](#k4-)
* 05 - [K5](#k5-)
* 05 - [K6](#k6-)

## K1 <a name="k1"></a> 
> [⇧ **Nach oben**](#inhaltsverzeichnis)

Die Umgebung wurde bereits in der LB2 eingerichtet und eine Dokumentation findet man unter:
![K1 Dokumentation LB2](https://github.com/YongYong01/TBZM300/tree/master/LB2#k1-)

## K2 <a name="k2"></a> 
> [⇧ **Nach oben**](#inhaltsverzeichnis)

Die einzelnen Git Dokumentationen sind in der LB2-Arbeit zu finden unter folgendem Link:
![K2 Dokumentation LB2](https://github.com/YongYong01/TBZM300/tree/master/LB2#k2-)

**Git**

**Branch** 

Ein Branch ist eine isolierte Entwicklungszone. Hier testet man einzelne Skripts oder Programme bevor sie in die Produktion kommen.
Man kann Beispielsweise eine Entwicklungszone mit git branch "Name" einrichten und von dort aus ausserhalb der Produktiven Zone arbeiten. Da man getrennt ist, wird die "master" Umgebung nicht beinträchtig. 


**Tags** 

Tags sind Referenzen für eine bestimmte Version einer GIT Datei


**Forks** 

Wenn man ein bestimmmtes GIT Repository forked, dann zieht man eine eigene Version auf das eigene GIT


**Commands**

| Commands | Bedeutung |
| -------------- | -------------- |
| git branch | Mit diesem Befehl listet man alle Branches im eigenem Repo auf. Ebenfalls ist es möglich eigene Branches zu erstellen oder zu dem genannten Branch zu wechseln |
| git checkout | Mit diesem Befehl wechselt man einen Branch |
| git commit | Damit ruft man eine Bestätigung für eine gespeicherte Aktion aus |
| git clone | Mit diesem Befehl klont man lokal ein Repository aus einem Git |

## Links

* [Git scm Basic Branches](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) 
* [Git Buch](https://git-scm.com/book/de/v2)

**Persönlicher Wissensstand**

Da ich das Wahlmodul 901 besuche, weiss ich im Grunde, wie ich eigene Container erstellen kann. Linux benutze ich sowieso täglich und das Vagrant habe ich für die LB2 angewendet.

## K3 <a name="k3"></a> 
> [⇧ **Nach oben**](#inhaltsverzeichnis)

#### Netzwerkplan

    +------------------------------------------------------------------------------------------------+
    | Netzwerk: 10.0.2.0/24                                                                          |
    |+----------------------------------------------------------------------------------------------+|
    || Hostname: ch-web01                                                                           ||
    || OS: Ubunt  16.04 LTS                                                                         ||
    ||                                                                                              ||
    || LAN enp3s0: 10.0.2.15                                                                        ||
    || Docker docker0: 172.17.0.1                                                                   ||
    || Port: 80, 443, 8080, 8082                                                                    ||
    || NAT: 32760-32780, 80, 8080, 8081, 8082, 3306, 2368                                           ||
    ||                                                                                              ||
    || +-----------------------------------------+      +-----------------------------------------+ ||
    || | Ghost Container                       |      | Apache Container                        | ||
    || | Ports: 8080, 2368                       |      | Ports: 80, 443, 8081                    | ||
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
    || 
    |+----------------------------------------------------------------------------------------------+|
    +------------------------------------------------------------------------------------------------+

**Vagrantfile**

    Vagrant.configure("2") do |config|
        # Jenkins and Apache Virtual Machine
        config.vm.define "web01" do |web01|
            web01.vm.box = "ubuntu/xenial64"
            
            # Portforwarding, Jenkins 8082, http 80, sql 3306
            web01.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
            web01.vm.network "forwarded_port", guest:8081, host:8081, auto_correct: true
            web01.vm.network "forwarded_port", guest:8082, host:8082, auto_correct: true
            web01.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true 
            web01.vm.network "forwarded_port", guest:2368, host:2368, auto_correct: true
            web01.vm.network "forwarded_port", guest:3001, host:3001, auto_correct: true 
            
            # Enabling a forwarded Portrange for Jenkins
            for i in 32760..32780
                    web01.vm.network :forwarded_port, guest: i, host: i
            end	
        
            # Network web01	
            web01.vm.network "private_network", ip: "192.168.0.3"		
        
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
                sudo apt-get -y install ufw
                sudo apt-get -y install docker
                sudo apt-get -y install docker.io
                sh /vagrant/scripts/docker_web01.sh
                sh /vagrant/ghost/ghost_create.sh
            SHELL
            
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
                sudo apt-get -y install ufw
                sudo apt-get -y install docker
                sudo apt-get -y install docker.io
            SHELL
            
            # Network db01:
            db01.vm.network "private_network", ip: "192.168.0.4"
            
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

**Standardconfig für Ghost**

    version: '3.1'

    services:

    ghost:
        image: ghost:1-alpine
        restart: always
        ports:
        - 8080:2368
        environment:
        # see https://docs.ghost.org/docs/config#section-running-ghost-with-config-env-variables
        database__client: mysql
        database__connection__host: db
        database__connection__user: root
        database__connection__password: example
        database__connection__database: ghost

    db:
        image: mysql:5.7
        restart: always
        environment:
        MYSQL_ROOT_PASSWORD: Server.22



#### Docker Befehle

| Command | Bedeutung |
| ---- | ---- |
| docker build "Source" | Erstellt ein Docker image | 
| docker images | Zeigt alle verfügbare Docker images |
| docker rmi "image" | Löscht ein Docker image |
| docker run "image" | startet ein Docker image |
| docker exec it "Container" \bin\bash | Exploriert einen Container |

## K4 <a name="k4"></a> 

**Was ist Docker?**

Docker ist ein Open-Source-Projekt zur Automatisierung der Bereitstellung von Anwendungen als portable Container, die in der Cloud oder vor Ort ausgeführt werden können. Docker-Image-Container können unter Linux und Windows ausgeführt werden. Windows-Bilder können jedoch nur auf Windows-Rechnern ausgeführt werden und Linux-Bilder können auf Linux-Rechnern und Windows-Rechnern, wobei der Host ein Server oder eine VM ist.


Architektur Docker:

![DockerArchitecture](images/DockerArchitecture.jpeg)

**Sicherheitseinstellungen Docker**

Für alle Applikationen kann ein andere Host Port weitergeleitet werden. Diese definiert man mit der Zeile EXPOSE.
Anderweitige Einstellungen können vorgenommen werden, indem man einem User die Berechtigung gibt einen gewissen Container anzupassen.
Sonst noch kann man Gruppeneinstellungen vornehmen, damit nur eine gewisse Benutzergruppe einen Container verwalten kann.

**Was ist Ghost?**

Ghost ist eine vollständig Open Source, anpassungsfähige Plattform für den Aufbau und Betrieb einer modernen Online-Publikation. 

Ghost Architektur:

![Ghost Architecture](images/GhostArchitecture.png)

**Microservice**
Ein Mikroservice ist ein einzelner Prozess eines grossen Konstruktes. Der Sinn von Mikroservicen ist, dass man nicht alles in einer grossen Applikation abspeichert, sondern man spaltet jeden einzelnen Ablauf ab, damit man eine höhere Erreichbarkeit erzielen.

Mein Microservice:

    var http = require("http");
    http.createServer(function (request, response) {
        // Send the HTTP header 
        // HTTP Status: 200 : OK
        // Content Type: text/plain
        response.writeHead(200, {'Content-Type': 'text/plain'});
        
        // Send the response body as "Hello World"
        response.end('Hello World\n');
    }).listen(8081);
    
    // Console will print the message
    console.log('Server running at http://127.0.0.1:8081/');


Mein Dockerfile:

    FROM node:10
    COPY helloworld.js ./
    EXPOSE 8081
    CMD [ "node", "hello_world.js" ]

**Service Überwachung**

Docker Container kann man mit verschiedenen Befehlen überwachen. Zum einen kann man alle Docker Prozesse mittels docker ps anzeigen und falls man alle Container auflisten will, dann gibt es den Befehl Docker Container list.
Mit Docker logs zeigt man aktive statistiken eines Containers auf. Zusätzlich zeigt er die stderr und stdout statistiken raus.

*stderr*

Stderr, auch bekannt als Standardfehler, ist der Standard-Dateideskriptor, mit dem ein Prozess Fehlermeldungen schreiben kann.

In Unix-ähnlichen Betriebssystemen wie Linux durch den POSIX-Standard definiert..

Im Terminal wird der Standardfehler standardmässig auf dem Bildschirm des Benutzers angezeigt.

*stdout*

Stdout, auch bekannt als Standardausgabe, ist der Standard-Dateideskriptor, mit dem ein Prozess die Ausgabe schreiben kann.

Im Terminal wird die Standardausgabe standardmässig auf dem Bildschirm des Benutzers angezeigt.

## K5 <a name="k5"></a> 
> [⇧ **Nach oben**](#inhaltsverzeichnis)


**Vergleich Vorwissem**

Ich habe im groben Zügen das gleiche aufgesetzt wie in der LB2. Jedoch weiss ich nun wie ich meine Docker Container überwachen kann und aktive Benachrichtigungen dazu einschalte. Ausserdem habe ich neu das Blogging Tool Ghost aufgesetzt.

**Reflexion**
In diesem Projekt konnte ich eher die Sicherheitsaspekte von Containers anschauen. Die neuerlernten Techniken werden mir auch zukünftig in Projekten helfen.


## K6 <a name="k6"></a> 
> [⇧ **Nach oben**](#inhaltsverzeichnis)

**Image Bereitstellung**
Beispiel von mc-b/m300

    FROM ubuntu:14.04

    RUN apt-get update
    RUN apt-get -q -y install apache2 

    # Konfiguration Apache
    ENV APACHE_RUN_USER www-data
    ENV APACHE_RUN_GROUP www-data
    ENV APACHE_LOG_DIR /var/log/apache2

    RUN mkdir -p /var/lock/apache2 /var/run/apache2

    EXPOSE 80

    VOLUME /var/www/html

    CMD /bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"

**Kubernetes Übung**
Damit kann man eine Kubernetesumgebung mit zusätzlichem Frontend einrichten.

git clone https://github.com/mc-b/lernkube 

cd lernkube 

git clone https://github.com/mc-b/iot.kafka 

cp templates/MISEGR.yaml config.yaml 

vagrant plugin install vagrant-disksize 

vagrant up 

source kubeenv 

kubectlapply -f misegr/ewolff/ms-kubernetes/ 

**CMS Ghost**

Mit Ghost konnte ich eine Blogging Seite einrichten.

![GhostIntroduction](images/GhostIntroduction.png)

[Documentation Ghost](https://ghost.org/docs/)

**Continuous Integration**
Um Continous Integration in unser System zu integrieren, kann man dazu Jenkins verwenden. Dies kann mit folgendem Image File erstellt werden:

sudo apt-get update && sudo apt-get install -y apt-transport-https 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - 
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/ kubernetes.list 
sudo apt-get update 
sudo apt-get install -y kubectl 

kubectl apply -f deployment.yaml

    apiVersion: v1
    kind: Service
    metadata:
    name: jenkins
    labels:
        app: jenkins
        group: devops    
        tier: frontend
    spec:
    type: LoadBalancer
    ports:
    - port: 8080
        nodePort: 32100  
        protocol: TCP
    selector:
        app: jenkins
    ---
    apiVersion: apps/v1beta2 # for versions before 1.8.0 use apps/v1beta1
    kind: Deployment
    metadata:
    name: jenkins
    spec:
    replicas: 1
    selector:
        matchLabels:
        app: jenkins
    template:
        metadata:
        labels:
            app: jenkins
            group: devops
            tier: frontend
        spec:
        securityContext:
        runAsUser: 1000
        fsGroup: 999  
        supplementalGroups: [ 1000, 100, 0 ]  
        containers:
        - name: jenkins
            image: misegr/jenkins
            imagePullPolicy: IfNotPresent        
            env:
            - name: JENKINS_PASS
            value: admin        
            ports:
            - containerPort: 8080
            name: jenkins
            # Volumes im Container
            volumeMounts:
            - mountPath: "/src"
            subPath: src
            name: "host-data"
            - mountPath: "/var/run/docker.sock"
            name: "docker-sock"   
            - mountPath: "/usr/bin/kubectl"
            name: "kubectl"          
            - mountPath: "/var/jenkins_home/.kube"
            name: "kube"  
        # Volumes in Host
        volumes:
        - name: "host-data"
            persistentVolumeClaim:
            claimName: data-claim 
        - name: "docker-cli-data"
            hostPath:
            path: "/data/docker-cli"
        - name: "docker-sock"
            hostPath:
            path: "/var/run/docker.sock" 
        - name: "kubectl"
            hostPath:
            path: "/usr/bin/kubectl" 
        - name: "kube"
            hostPath:
            path: "/home/vagrant/.kube" 
                        
