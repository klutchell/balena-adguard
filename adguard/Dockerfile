# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v1.0.0@sha256:f00a586f0d1caa74f149340bfb225014960310488ffa838406b89256900a96c2

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
