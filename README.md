# balena-adguard

If you're looking for a way to quickly and easily get up and running with an AdGuard Home device for your home network, this is the project for you.

This project is a [balenaCloud](https://www.balena.io/cloud) stack with the following services:

- [AdGuard Home](https://adguard.com/en/adguard-home/overview.html) is a network-wide software for blocking ads & tracking.

balenaCloud is a free service to remotely manage and update your IoT devices through an online dashboard interface, as well as providing remote access to the AdGuard Home web interface without any additional configuation.

## Getting Started

You can one-click-deploy this project to balena using the button below:

[![deploy with balena](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/klutchell/balena-adguard)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application,
flashing a device, downloading the project and pushing it via the [balena CLI](https://github.com/balena-io/balena-cli).

### Application Environment Variables

Application environment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

| Name           | Description                                                                                                      |
| -------------- | ---------------------------------------------------------------------------------------------------------------- |
| `TZ`           | Inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location |
| `SET_HOSTNAME` | Set a custom hostname on application start. Default is `adguard`.                                                |

## Usage

### Initial setup

Once your device joins the fleet you'll need to allow some time for it to download the application.

On your router or DHCP server assign a static IP to your AdGuard Home device.

1. Connect to `http://adguard.local` or if that doesn't work `http://YOUR-DEVICE-IP:80/install.html` in your browser
    - `YOUR-DEVICE-IP` should be the IP assigned via DHCP from your home router, you can find this IP in your router interface.  
2. Select `All interfaces` and port `80` for the Admin Web Interface listen interface
3. Select either `eth0` or `wlan0` and port `53` for the DNS server listen interface
4. Provide an admin username and password

Documentation for Adguard Home can be found at https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started

### Encryption setup

<https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption>

Check out the `letsencrypt` branch of this repo for instructions on using
certbot to automatically generate and renew SSL certificates.

<https://github.com/klutchell/balena-adguard/tree/letsencrypt>

## Acknowledgments

Original software is by AdGuard: <https://adguard.com/en/adguard-home/overview.html>
