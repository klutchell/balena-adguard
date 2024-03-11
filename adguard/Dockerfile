# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.45@sha256:52a9c2e7b4c56e5f08e1b2f3196d500c931adadc8917712ff9ef9ea922c030fe

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
