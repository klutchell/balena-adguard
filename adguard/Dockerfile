# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.55@sha256:2979cc78a28aceb77f90980a5440578dbb7bc406dffe261e9ae402750193bde0

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
