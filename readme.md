# WT-IS: Docker webserver met database

Deze omgeving maakt een database server en een web server aan gebaseerd
op [Docker](https://www.docker.com/). Bij het opstarten van de omgeving
wordt automatisch de database *Fletnix* aangemaakt en gevuld met
voorbeelddata.

## Benodigde software

De volgende software heb je nodig:

### Docker (verplicht)

Installeer Docker: <https://www.docker.com/get-started>. Voor zowel
Windows, Mac als Linux zijn er installaties beschikbaar.

### Visual Studio Code (aanbevolen)

Installeer Visual Studio Code: <https://code.visualstudio.com/>
Waarschijnlijk heb je deze al geïnstalleerd en gebruik je die al om je
HTML-pagina's te maken.

## Eerste keer opstarten en aanmaken omgeving

Bij de eerste keer opstarten van de omgeving worden er veel bestanden
gedownload en duurt het even voordat alles klaar is.

### Clone GitHub-repository naar lokale machine

Clone of download de volledige repository van deze omgeving naar je
lokale machine.

Als je gebruik maakt van GitHub Desktop, klik in de Github-repo op 'Open
with GitHub Desktop'.

### Visual Studio Code: aanmaken van servers

Open met Visual Studio Code de map waarin je repository hebt gecloned.
Met GitHub Desktop: klik op 'Open with Visual Studio Code'.

Onderin Visual Studio Code zou een *terminal* open moeten staan. Als dit
niet het geval is, kies in het menu van Visual Studio Code onder
*Terminal* de optie *New terminal*.

![Terminal Visual Studio Code](readme-images/vscode-terminal.png).

Type in de terminal `docker compose up` en daarna *enter*.

Nu worden  een database server en een web server aangemaakt. Daarna worden beide servers opgestart en de *Fletnix* database wordt automatisch
aangemaakt en gevuld. Tijdens dit proces zie je een behoorlijk aantal meldingen voorbij komen.

Uiteindelijk moet de volgende melding in beeld verschijnen **Database exists, webserver starting!**. Zoiets als

![Servers aangemaakt](readme-images/vscode-servers-created.png)

Test de webserver:

- *It works!": <http://localhost:8080> of <http://localhost:8080/index.php>
- *phpinfo*: <http://localhost:8080/phpinfo.php>
- *Data uit de database*: <http://localhost:8080/moviegenres.php>

