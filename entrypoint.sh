#!/bin/bash

if [ -z ${VARBASEPATH+x} ]; then echo "VARBASEPATH is unset"; sed -i "s/VARBASEPATH/$VARBASEPATH/g" /opt/cerebro/conf/application.conf; fi
if [ -z ${ELASTICSEARCH_NAME+x} ]; then echo "ELASTICSEARCH_NAME is unset"; sed -i "s/ELASTICSEARCH_NAME/$ELASTICSEARCH_NAME/g" /opt/cerebro/conf/application.conf; fi
if [ -z ${ELASTICSEARCH_HOST+x} ]; then echo "ELASTICSEARCH_HOST is unset"; sed -i "s/ELASTICSEARCH_HOST/$ELASTICSEARCH_HOST/g" /opt/cerebro/conf/application.conf; fi
if [ -z ${ELASTICSEARCH_PORT+x} ]; then echo "ELASTICSEARCH_PORT is unset"; sed -i "s/ELASTICSEARCH_PORT/$ELASTICSEARCH_PORT/g" /opt/cerebro/conf/application.conf; fi
if [ -z ${ELASTICSEARCH_USER+x} ]; then echo "ELASTICSEARCH_USER is unset"; sed -i "s/ELASTICSEARCH_USER/$ELASTICSEARCH_USER/g" /opt/cerebro/conf/application.conf; fi
if [ -z ${ELASTICSEARCH_PASSWORD+x} ]; then echo "ELASTICSEARCH_PASSWORD is unset"; sed -i "s/ELASTICSEARCH_PASSWORD/$ELASTICSEARCH_PASSWORD/g" /opt/cerebro/conf/application.conf; fi

cd /opt/cerebro
/opt/cerebro/bin/cerebro
