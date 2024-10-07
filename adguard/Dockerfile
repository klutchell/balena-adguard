# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.53@sha256:d9c512051141e6a617d773f16cdf6782c178464c6e766acf9fe63482a171f95c

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
