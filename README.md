# balena-adguard

If you're looking for a way to quickly and easily get up and running with an AdGuard Home device for your home network, this is the project for you.

This project is a [balenaCloud](https://www.balena.io/cloud) stack with the following services:

* [AdGuard Home](https://adguard.com/en/adguard-home/overview.html)

balenaCloud is a free service to remotely manage and update your IoT devices through an online dashboard interface, as well as providing remote access to the AdGuard Home web interface without any additional configuation.

## Requirements

* RaspberryPi3 or a similar aarch64 device supported by BalenaCloud
* Custom domain name with Cloudflare DNS (eg. adguard.example.com)

## Getting Started

To get started you'll first need to sign up for a free balenaCloud account and flash your device.

<https://www.balena.io/docs/learn/getting-started>

## Deployment

Once your account is set up, deployment is carried out by downloading the project and pushing it to your device either via Git or the balena CLI.

### Application Environment Variables

Application envionment variables apply to all services within the application, and can be applied fleet-wide to apply to multiple devices.

|Name|Example|Purpose|
|---|---|---|
|`TZ`|`America/Toronto`|To inform services of the [timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) in your location, in order to set times and dates within the applications correctly|
|`CLOUDFLARE_EMAIL`|`cloudflare@example.com`|(optional) Cloudflare email address for Letsencrypt SSL certificate generation via [certbot](https://certbot-dns-cloudflare.readthedocs.io/en/stable/)|
|`CLOUDFLARE_API_KEY`|`0123456789abcdef0123456789abcdef01234567`|(optional) Cloudflare API key for Letsencrypt SSL certificate generation via [certbot](https://certbot-dns-cloudflare.readthedocs.io/en/stable/)|
|`CLOUDFLARE_DOMAINS`|`adguard.example.com`|(optional) Cloudflare domains to obtain SSL certificates|

## Usage

<https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started>

**During AdGuard setup, make sure to select your wireless or wired interface for DNS binding, NOT the balena or docker interfaces.**

To enable [encryption](https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption) with your custom domain:

1. in the BalenaCloud Web Dashboard - provide the 3 required CLOUDFLARE application environment variables as defined above
2. in the BalenaCloud Web Dashboard - observe the dns-cloudflare container logs to see if certs were successfully generated
3. Open AdGuard Home web interface and go to settings
4. Scroll down to the "Encryption" settings
5. in the BalenaCloud Web Dashboard - SSH into the dns-cloudflare container
6. copy/paste the contents of `/etc/letsencrypt/{adguard.example.com}/fullchain.pem` in the Certificates field
7. copy/paste the contents of `/etc/letsencrypt/{adguard.example.com}/privkey.pem` in the Private Key field
8. write your domain name in the Server name field

The certificate script will run once every 24 hours to check if renewal is required.

## Author

Kyle Harding <kylemharding@gmail.com>

## Acknowledgments

* <https://github.com/AdguardTeam/AdGuardHome>

## License

[MIT License](./LICENSE)
