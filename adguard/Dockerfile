# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.80@sha256:e2e1b48c832f7705be915873f95de0d5114de573736441d7f2923a8a6293027c

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
