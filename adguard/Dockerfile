# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.56@sha256:c64a0b37f7b9f7e065089f34686c1232a4dd5401a199a1b20b074d90b955eebd

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
