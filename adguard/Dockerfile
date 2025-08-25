# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.65@sha256:d765078d2140b464ce837128a4f536f80b4c9ab7fd5b6833ae690b72fae40897

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
