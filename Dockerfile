FROM openjdk:11-jre-slim-buster
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN apt update \
    && apt install -y curl unzip \
    && apt clean \
    && curl -L https://github.com/lmenezes/cerebro/releases/download/v0.9.4/cerebro-0.9.4.zip -o /opt/cerebro-0.9.4.zip \
    && cd /opt \
    && unzip cerebro-0.9.4.zip \
    && rm cerebro-0.9.4.zip \
    && mv -f /opt/cerebro-0.9.4 /opt/cerebro \
    && rm /opt/cerebro/conf/application.conf \
    && mkdir /opt/cerebro/logs \
    && touch /opt/cerebro/logs/application.log
RUN useradd -ms /bin/bash cerebro \
    && chown -R cerebro:cerebro /opt/cerebro
COPY ./application.conf /opt/cerebro/conf
USER cerebro
STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
