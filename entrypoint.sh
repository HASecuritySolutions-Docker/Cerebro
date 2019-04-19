#!/bin/bash

if [ -z ${var+x} ]; then echo "BASEPATH is unset"; sed -i "s/basePath = \"\/\"/basePath = \"$(echo $BASEPATH | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')\"/g" /opt/cerebro/conf/application.conf; fi
sed -i "s/http:\/\/elasticsearch:9200/$PROTOCOL:\/\/$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT/g" /opt/cerebro/conf/application.conf

cd /opt/cerebro
/opt/cerebro/bin/cerebro
