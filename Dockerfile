FROM openjdk:8-jre
MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v0.8.4/cerebro-0.8.4.zip -o /opt/cerebro.zip \
    && cd /opt \
    && unzip cerebro.zip \
    & mv -f /opt/cerebro-0.8.4 /opt/cerebro \
    && rm cerebro.zip \
    && rm /opt/cerebro/conf/application.conf \
    && mkdir /opt/cerebro/logs \
    && touch /opt/cerebro/logs/application.log
RUN useradd -ms /bin/bash cerebro \
    && chown -R cerebro:cerebro /opt/cerebro
COPY ./application.conf /opt/cerebro/conf
USER cerebro
STOPSIGNAL SIGTERM

CMD /opt/cerebro/bin/cerebro
