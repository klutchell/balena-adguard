# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.46@sha256:9bcf15ca5d860c58dbe8c7f175d16291bf0ddc9621645facdd91d5253ab8ce46

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
