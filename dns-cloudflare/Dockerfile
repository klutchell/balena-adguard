FROM certbot/dns-cloudflare:v0.31.0

COPY renew.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/renew.sh

CMD [ "renew.sh" ]
