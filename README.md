# vagrant-elasticsearch

Installiert Elasticsearch und das head Plugin in einer VM.  
Es wird ein Portforwar von Port 9200 eingerichtet, so das mit localhost:9200 vom Hostsystem
auf die Elasticsearch Instanz zugegriffen werden kann.  
  
Nach dem Aufruf von  
  
**vagrant up**  
  
kann im Browser <http://localhost:9200/_plugin/head> aufgerufen werden und es sollte ein Seite ähnlich dieser ausgeliefert werden.  
  
!(elastic.png)

