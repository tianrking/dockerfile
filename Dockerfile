FROM ubuntu:14.04
MAINTAINER Tianrking <tian.r.king@gmail.com>
ENV REFRESHED_AT 2016-08-16
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install python3 -y \
    && apt-get install python -y \
    && apt-get install git -y \
    && git clone -b manyuser https://github.com/breakwa11/shadowsocks.git \
    && python shadowsocks/shadowsocks/server.py -d start \
    && apt-get install wget -y \
    && apt-get install unzip -y \
    && wget https://github.com/snooda/net-speeder/archive/master.zip \
    && unzip master.zip \
    && apt-get install libnet1-dev -y \
    && apt-get install libpcap0.8-dev -y
EXPOSE 8388 
WORKDIR "net-speeder-master/"
RUN  sh build.sh -DCOOKED \
    && sh build.sh \
    && ./net_speeder eth0 "ip" 

