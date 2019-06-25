FROM debian:9

# avoid warnings during package installation
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -yq --no-install-recommends gcc-aarch64-linux-gnu python-setuptools python-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && pip install certbot-dns-cloudflare

COPY renew.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/renew.sh

CMD [ "renew.sh" ]