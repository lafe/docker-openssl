# docker-openssl

This repository contains a Dockerfile for a lightweight container based on Alpine Linux with the OpenSSL tool installed. The primary purpose of this container is to use OpenSSL to create self-signed certificates without the need to install OpenSSL on the computer itself.

## Maintainers

Original Maintainer: [CenturyLink Labs](https://github.com/CenturyLinkLabs/openssl) <clt-labs-futuretech@centurylink.com>
Current Maintainer: Lars Fernhomberg

## Build image

To build the image, you have to use the command `docker build -t openssl .`. This creates a new Docker image called "openssl".

## Usage

Usage `docker run --rm  -e COMMON_NAME=<Common Name> -e KEY_NAME=<Cert File Names Prefix> -v /var/certs:/certs openssl`
