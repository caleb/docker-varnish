FROM debian:jessie

MAINTAINER Caleb Land <caleb@land.fm>

ENV VARNISH_VERSION      5.0.0
ENV VARNISH_FULL_VERSION 5.0.0-1
ENV VARNISH_ARCH         amd64

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

ADD https://repo.varnish-cache.org/pkg/${VARNISH_VERSION}/varnish_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb /varnish_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb
ADD https://repo.varnish-cache.org/pkg/${VARNISH_VERSION}/varnish-dev_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb /varnish-dev_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb

RUN apt-get update \
&&  apt-get install -y libedit2 libjemalloc1 build-essential pkg-config python \
&&  rm -rf /var/lib/apt/lists/*

RUN dpkg -i /varnish_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb \
&&  dpkg -i /varnish-dev_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb \
&&  rm /varnish_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb \
&&  rm /varnish-dev_${VARNISH_FULL_VERSION}_${VARNISH_ARCH}.deb

ADD docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["varnish"]
