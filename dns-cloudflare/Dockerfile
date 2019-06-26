FROM debian:9

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list

RUN apt-get update \
    && apt-get install -yq --no-install-recommends certbot python3-certbot-dns-cloudflare \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY run.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/run.sh

VOLUME /root/.secrets

CMD [ "run.sh" ]