# https://hub.docker.com/r/tailscale/tailscale
# https://github.com/tailscale/tailscale/blob/main/cmd/containerboot/main.go
# https://tailscale.com/kb/1282/docker
# https://tailscale.com/kb/1278/tailscaled
# https://tailscale.com/kb/1241/tailscale-up
# https://tailscale.com/kb/1242/tailscale-serve
# https://tailscale.com/kb/1311/tailscale-funnel
FROM tailscale/tailscale:v1.72.1@sha256:83a6faec34866f70914a7d241d6ca749e6914f08f4f9059d942e1c3088dc001b

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

ENV TS_SOCKET /var/run/tailscale/tailscaled.sock
