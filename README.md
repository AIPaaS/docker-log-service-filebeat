# docker-log-service-filebeat

## filebeat

# build

docker build -t ai/filebeat:5.0.0 .

# run

docker run --name fb-test -v /path:/home -it ai/filebeat:5.0.0 /bin/bash

/usr/share/filebeat/bin/filebeat -e -c "/etc/filebeat/filebeat.yml"

# path

Home path: [/usr/share/filebeat/bin] 

Config path: [/usr/share/filebeat/bin] 

Data path: [/usr/share/filebeat/bin/data] 

Logs path: [/usr/share/filebeat/bin/logs]
