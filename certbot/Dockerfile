FROM certbot/certbot:arm64v8-latest

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
