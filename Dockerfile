FROM openjdk:8-jre
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

# Base Path setting - Necessary if you are using a reverse proxy such as Nginx
ENV BASEPATH /
# Alias, DNS or IP of Elasticsearch host to be queried by Elastalert. Set in default Elasticsearch configuration file.
ENV ELASTICSEARCH_HOST elasticsearch
# Port Elasticsearch runs on
ENV ELASTICSEARCH_PORT 9200
# Transport method - either http or https
ENV PROTOCOL http
# Nice name for ES node
ENV ELASTICSEARCH_NAME elasticsearch
# User for ES authentication
ENV ELASTICSEARCH_USER ""
# Password for ES authentication
ENV ELASTICSEARCH_PASSWORD ""

RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v0.8.3/cerebro-0.8.3.zip -o /opt/cerebro-0.8.3.zip \
    cd /opt \
    && unzip cerebro-0.8.3.zip \
    && rm cerebro-0.8.3.zip \
    && mv -f /opt/cerebro-0.8.3 /opt/cerebro \
    && rm /opt/cerebro/conf/application.conf \
    && mkdir /opt/cerebro/logs \
    && touch /opt/cerebro/logs/application.log
RUN useradd -ms /bin/bash cerebro \
    && chown -R cerebro:cerebro /opt/cerebro
COPY ./entrypoint.sh /opt/
COPY ./application.conf /opt/cerebro/conf
RUN chmod +x /opt/entrypoint.sh \
    && chown -R cerebro:cerebro /opt/entrypoint.sh
USER cerebro
STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
