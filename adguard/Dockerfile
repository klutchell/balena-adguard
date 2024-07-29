# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.52@sha256:d16cc7517ab96f843e7f8bf8826402dba98f5e6b175858920296243332391589

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
