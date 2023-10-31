# docker-openssl

This repository contains a Dockerfile for a lightweight container based on Alpine Linux with the OpenSSL tool installed. The primary purpose of this container is to use OpenSSL to create self-signed certificates without the need to install OpenSSL on the computer itself.

## Maintainers

- Original Maintainer: [CenturyLink Labs](https://github.com/CenturyLinkLabs/openssl) <clt-labs-futuretech@centurylink.com>
- Current Maintainer: Lars Fernhomberg

## Build image

To build the image, you have to use the command `docker build -t openssl .`. This creates a new Docker image called "openssl".

## Usage

Usage `docker run --rm -v /var/certs:/certs openssl <OpenSSL commands>`. The certificates will be mapped into the "/certs/" folder, so you have to add "/certs/" to file names.

### Create a PFX certificate file

PowerShell script to generate a self-signed certificate in PFX format:

```PowerShell
$keyName = "Cert"
$path = "C:\Temp\"

$duration = 365
$commonName = "Common Name"
$pfxPassword = "1234"

docker run --rm -v "$($path):/certs" openssl genrsa -out /certs/$keyName.key 1024
docker run --rm -v "$($path):/certs" openssl req -new -newkey rsa:4096 -days $duration -nodes -subj "/C=/ST=/L=/O=/CN=$($commonName)" -keyout /certs/$keyName.key -out /certs/$keyName.csr
docker run --rm -v "$($path):/certs" openssl x509 -req -days $duration -in /certs/$keyName.csr -signkey /certs/$keyName.key -out /certs/$keyName.crt
docker run --rm -v "$($path):/certs" openssl pkcs12 -export -out /certs/$keyName.pfx -inkey /certs/$keyName.key -in /certs/$keyName.crt -password "pass:$pfxPassword"
```
