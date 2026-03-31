# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.73@sha256:7fbf01d73ecb7a32d2d9e6cef8bf88e64bd787889ca80a1e8bce30cd4c084442

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
