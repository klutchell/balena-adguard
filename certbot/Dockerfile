FROM debian:9

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list

RUN apt-get update \
    && apt-get install -yq --no-install-recommends certbot=0.28.0-1~deb9u2 python3-certbot-dns-cloudflare=0.23.0-2~bpo9+1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]