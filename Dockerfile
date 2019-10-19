# Container to run cli bittorrent client
# docker run --restart unless-stopped -tid -p 6881-6887:6881-6887/tcp -p 6881-6887:6881-6887/udp -v /pathto/torrents:/torrents michaeljensen/docker-bittorrent:latest


FROM ubuntu:18.04

MAINTAINER Michael Jensen version:1.0

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && export DEBIAN_PRIORITY=critical && apt-get -y -o Dpkg::Options::="--force-confdef" dist-upgrade
RUN apt-get install -y bittornado
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /torrents
COPY .rtorrent.rc /root/.rtorrent.rc

EXPOSE 6881-6887/tcp
EXPOSE 6881-6887/udp

WORKDIR /torrents
CMD ["/usr/bin/rtorrent"]

