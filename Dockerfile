FROM openjdk:8-jre
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v0.8.3/cerebro-0.8.3.zip -o /opt/cerebro-0.8.3.zip \
    && cd /opt \
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
