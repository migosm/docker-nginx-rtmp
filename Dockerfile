FROM debian:jessie

RUN mkdir -p /srv/build
COPY nginx-rtmp-module /srv/build/nginx-rtmp-module
RUN apt-get clean all && apt-get update
RUN apt-get install -y wget gcc make libpcre3-dev libpcre3 libssl-dev
RUN cd /srv/build && \
    wget http://nginx.org/download/nginx-1.10.1.tar.gz && \
    tar xzvf nginx-1.10.1.tar.gz
RUN cd /srv/build/nginx-1.10.1 && \
    ./configure --prefix=/usr --with-http_ssl_module --add-module=/srv/build/nginx-rtmp-module && \
    make -j4 && \
    make -j4 install
