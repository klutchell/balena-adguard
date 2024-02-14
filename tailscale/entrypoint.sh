#!/usr/bin/env sh

set -eu

if [ -z "${TS_AUTH_KEY:-}" ]; then
    echo "TS_AUTH_KEY is not set. Exiting."
    exit 1
fi

# attempt to load required kernel modules
modprobe tun || true
modprobe wireguard || true

# create tun device if it doesn't exist
mkdir -p /dev/net
[ ! -c /dev/net/tun ] && mknod /dev/net/tun c 10 200

exec /usr/local/bin/containerboot
