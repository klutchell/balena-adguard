# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.62@sha256:b04764acecf1f663a23f55e95724a3c7ca0dc7f3a6f957d29005728b6bd036f2

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
