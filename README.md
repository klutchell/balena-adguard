# balena-adguard

[AdGuard Home](https://adguard.com/en/adguard-home/overview.html) on
balenaCloud: Easily deploy a network-wide ad blocker and DNS server to your home
network, with secure remote management and optional Tailscale VPN support.

## Why use this project?

- **Easy, secure remote access** via balenaCloud dashboard
- **No router changes required** for remote access
- **Runs on a minimal, container-optimized OS**
- **Device dashboard and SSH access** via balenaCloud
- **Optional Tailscale VPN** for secure device networking

balenaCloud is a free service to remotely manage and update your IoT devices
through an online dashboard interface, as well as providing remote access to the
AdGuard Home web interface without any additional configuration.

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![deploy with balena](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-adguard)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a
[balenaCloud account](https://dashboard.balena-cloud.com) and application,
flashing a device, downloading the project and pushing it via the
[balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application environment variables apply to all services within the application,
and can be applied fleet-wide to apply to multiple devices.

| Name             | Description                                                                                                      |
| ---------------- | ---------------------------------------------------------------------------------------------------------------- |
| `TZ`             | Inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location |
| `SET_HOSTNAME`   | Set a custom hostname on application start. Default is `adguard`.                                                |
| `DNS_INTERFACES` | Optionally provide a space-separated list of interfaces to bind DNS. For example: `eth0 wlan0 tailscale0`.       |
| `TS_AUTHKEY`     | [Tailscale auth key](https://tailscale.com/kb/1085/auth-keys) to join an existing Tailnet. Default is unset.     |

## Usage

### Initial setup

Once your device joins the fleet you'll need to allow some time for it to
download the application.

Note that
[joining an Open Fleet](https://www.balena.io/blog/introducing-open-fleets-and-self-submitted-apps-and-blocks-on-balenahub/#join-fleet)
does not require a balena account nor does it add the device to your personal
balena dashboard. If you would rather manage your device and fleet directly you
can
[fork this fleet](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-adguard).

1. Connect to `http://adguard.local/` or if that doesn't work
   `http://YOUR-DEVICE-IP:80/install.html` in your browser
   - `YOUR-DEVICE-IP` should be the IP assigned via DHCP from your home router,
     you can find this IP in your router interface.
2. Select `All interfaces` and port `80` for the Admin Web Interface
3. Select an available physical interface and port `53` for the DNS server
4. Provide an admin username and password

Documentation for AdGuard Home can be found at
<https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started>

## Documentation & Support

- [AdGuard Home Getting Started](https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started)
- [balenaCloud Docs](https://www.balena.io/docs/)
- [Tailscale Docs](https://tailscale.com/kb/)

## Contributing

Pull requests and issues are welcome! Please open an issue or PR for any
features, fixes, or suggestions.

## Acknowledgments

- [AdGuard Home](https://adguard.com/en/adguard-home/overview.html) by AdGuard
- [balenablocks/hostname](https://github.com/balenablocks/hostname)
- [balena-tailscale](https://github.com/klutchell/balena-tailscale)
