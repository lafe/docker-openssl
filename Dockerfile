FROM alpine:3.18.4

LABEL org.opencontainers.image.authors="Lars Fernhomberg, Original maintainer: CenturyLink Labs <clt-labs-futuretech@centurylink.com>"

RUN apk add --no-cache openssl

ENTRYPOINT ["/usr/bin/openssl"]