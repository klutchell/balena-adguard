# https://hub.docker.com/r/adguard/adguardhome
FROM adguard/adguardhome:v0.107.78@sha256:1ea34eafe5dc691007946e8eaab7bf46b0de9412f39213d8c06e48b53bf9a6c5

# hadolint ignore=DL3018
RUN apk add --no-cache yq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ ]
