# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.72@sha256:4956b35b590286e5872fb4336d84a7862a2030c6efb4ca16442580c37d7ba32d

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
