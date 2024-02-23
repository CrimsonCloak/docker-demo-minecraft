# Demo Docker 

## Inhoud 
- [Demo Docker](#demo-docker)
  - [Inhoud](#inhoud)
    - [Definitie van Docker](#definitie-van-docker)
    - [Docker vs Virtual Machine](#docker-vs-virtual-machine)
    - [Containers, images en Dockerfiles](#containers-images-en-dockerfiles)
    - [Docker installatie](#docker-installatie)
    - [Docker run command](#docker-run-command)
  - ["Advanced" stuff:](#advanced-stuff)
    - [Docker Compose](#docker-compose)
    - [Volume binding](#volume-binding)
    - [Docker networking](#docker-networking)
    - [Demo via GitHub](#demo-via-github)
  - [(Re)sources](#resources)


### Definitie van Docker

Je hebt er al veel over gehoord, maar wat is Docker nu precies? Docker is een tool voor het ontwikkelen, uitvoeren en deployen van software. Het maakt gebruik van containerization technologie om applicaties te isoleren van de infrastructuur waarop deze draait. Dit maakt het mogelijk om sneller en betrouwbaarder software te leveren.

Het is ook een goede manier om te proberen omgaan met een van de grote problemen binnen het opleveren van software - "het werkt op mijn machine". Met Docker kan je een container maken die de applicatie en alle dependencies bevat, zodat deze overal kan worden uitgevoerd en op eenzelfde manier

### Docker vs Virtual Machine

Wat is nu het verschil met een virtuele machine? Een virtuele machine bevat een volledige besturingssysteem, terwijl een container alleen de applicatie en de dependencies bevat. Dit maakt containers veel lichter en sneller dan virtuele machines. Bovendien kan je met de Docker daemon (de service die containers beheert) meerdere containers op eenzelfde machine uitvoeren, terwijl je voor virtuele machines een hypervisor nodig hebt. 

Het is een beetje technisch en we gaan er niet te diep op in, maar het is belangrijk om te weten dat containers meer lightweight zijn dan virtuele machines en dat ze een goede manier zijn om applicaties te isoleren van de onderliggende infrastructuur. Het is ook een ideale tool om te experimenteren en testen!

### Containers, images en Dockerfiles


De drie grote termen die je het meest zal zien in verband met Docker zijn de containers, de images en een Dockerfile. We overlopen ze even in oplopende volgorde van complexiteit. Op het basisniveau heb je de Dockerfile. Dit is een bestand dat de configuratie van een container beschrijft. Het bevat de instructies die Docker moet volgen om een image te maken. Een image is een bestand dat alle benodigde bestanden en metadata bevat om een container te starten. Een container is een uitvoerbare instantie van een image. Het is een lopend proces dat is geïsoleerd van de rest van de machine. Je kan een Dockerfile/image een beetje zien als het recept en de bereiding, en een Docker container (die runt) als het gerecht dat gemaakt is en wordt opgediend. 

Hier is een visuele voorstelling van de structuur van Docker:

![Docker structure](/img/docker-structure.png)

Dat is een beetje de basis structuur van Docker. Er bestaat ook zoiets als DockerHub - een soort van GitHub voor Docker images die publiek beschikbaar kunnen gesteld worden. Hier kan je images vinden die door anderen zijn gemaakt en die je kan gebruiken om je eigen containers te maken. 

Zo kan je eenvoudig een container maken die een webserver bevat, zonder dat je zelf de webserver moet installeren en configureren of zelf een Dockerfile of image moet maken. Mijn tip: als je iets wilt uittesten/installeren van een software of service - zoek het eens op met "docker" erachter. De kans is groot dat je iets zult tegenkomen waar je mee verder kan experimenteren!




### Docker installatie

Persoonlijk raad ik aan om Docker te gebruiken op Linux systemen of via  VirtualBox VM's - zeker voor de Systeem- en netwerkbeheerders onder jullie. Je kan per OS heel gemakkelijk de installatie-instructies volgen - meestal bestaan deze uit het toevoegen van een repository aan de package manager, updaten van package manager en dan het installeren van Docker met behulp van de package manager.


Je kan ook Docker Desktop gebruiken op Windows, door het Windows Subsystem for Linux (WSL) te activeren, maar persoonlijk ben ik daar minder fan van omdat dit kan zorgen voor problemen met virtualisatie van VirtualBox. Maar met experimenteren kan je zelden kwaad doen, dus probeer het zeker eens uit!

TIP: docker runt eigenlijk als root en moet je dus standaard met sudo rechten gebruiken (aka - elke keer sudo doen.) Om dit te vermijden, kan je de user die je gebruikt toevoegen aan de docker groep met `sudo usermod -aG docker $USER`, en dan weer even in/uitloggen van je shell. Doe dit enkel voor lokaal testen! In productie zal docker ook zelden als root runnen, maar dat is een ander verhaal. Voor ons is het lekker gemakkelijk!

### Docker run command

Om de basis uit te voeren, kan je met de command line werken met 'docker run'. Hier zijn enkele basisoperaties om containers en images te beheren:

Container starten: `docker run  hello-world`

Container stoppen: `docker stop <container_id/naam>`

Container verwijderen: `docker rm <container_id/naam>`

Image verwijderen: `docker rmi <image_id/naam>`

Runnende containers bekijken: `docker ps`



## "Advanced" stuff:

### Docker Compose

In plaats van te werken met docker run commando's, kan je voor complexe uitwerkingen of voor een beter overzicht werken met docker compose. Wat is het? Het is eigenlijk een docker run commando omgezet naar YML-formaat, dat je opslaat als een "docker-compose.yml" file. Als je dan "docker-compose up" uitvoert, zal Docker de containers starten volgens de configuratie in de YML file. 

Dit is handig voor complexe configuraties, zoals een webserver met een database en een caching server. Je kan dan alles in één file opslaan en met één commando starten. Dit is ook handig voor het delen van configuraties met anderen, omdat je de YML file kan toevoegen aan je git repository bijvoorbeeld. 

### Volume binding

Je kan werken via Docker volumes om persistent data bij te houden; doe je dit niet, dan ben je al je data van in je container kwijt wanneer deze wordt verwijderd of crasht - niet altijd ideaal. Volume binding is een manier om bepaalde mappen/bestanden binnen je container te binden aan mappen/bestanden op je host machine. 

Zo kan je bijvoorbeeld een database in een container draaien, maar de data van de database opslaan op je host machine. Dit is handig voor het maken van backups, of voor het delen van data tussen containers.

### Docker networking

Het concept van Docker Networking wordt heel snel ingewikkeld. Het voornaamste om te weten is dat Docker containers kunnen geïsoleerd zijn van de rest van het netwerk. Dit betekent dat ze niet zomaar kunnen communiceren met andere containers of met de host machine. Docker heeft een aantal netwerkmodussen die je kan gebruiken om containers met elkaar te laten communiceren.

Dit is handig voor het maken van complexe netwerken, om structuur te behouden als je meerdere gelijkaardige netwerken hebt die niet met elkaar mogen/moeten communiceren of als je graag een beetje oefent met netwerken.

### Demo via GitHub
In deze GitHub repo, naast de markdown, vind je ook een docker-compose.yml file. Deze is een voorbeeld van hoe je met Docker een minecraft server kan opstarten! Er volgt een kort voorbeeld, maar de flow is de volgende:
1. Clone deze repo naar je lokale/virtuele machine
2. Open een terminal in de map van de repo
3. Voer `docker-compose up` uit
4. Wacht even, en je Minecraft server zou moeten opstarten
5. Open Minecraft en verbind met je server!

## (Re)sources
Hier zijn enkele nuttige bronnen en resources die je kan gebruiken (maar er zijn er zeker nog veel meer!):
- [Docker install documentation](https://docs.docker.com/engine/install/)
- [Docker Compose documentation](https://docs.docker.com/compose/)
- [Docker Networking documentation](https://docs.docker.com/network/)
- [Composerize - run command to docker-compose](https://composerize.com/)
- [Docker documentation](https://docs.docker.com/)
- [DockerHub](https://hub.docker.com/)
- [Docker cheat sheet](https://docs.docker.com/get-started/docker_cheatsheet.pdf)
- [Volledige guide voor Docker Minecraft server](https://docs.eiland-x.be/posts/minecraft-docker/) 
<!-- - duidelijk vermelden dat dit gemaakt is door Alexander, full disclosure no scam plz -->