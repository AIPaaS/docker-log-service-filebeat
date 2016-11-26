#!/bin/bash

# replace filebeat.yml params...
#sed 

echo "filebeat 5.0.0 starting ..."
var=${ES_IP_PORT} 
var=${var//,/ } 
for one_of_es_add in $var   
do  
    curl -XPUT 'http://'${one_of_es_add}'/_template/filebeat' -d@/etc/filebeat/filebeat.template.json
done  
/usr/share/filebeat/bin/filebeat -e -c "/etc/filebeat/filebeat.yml"
echo "filebeat 5.0.0 started ..."