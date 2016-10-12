FROM debian:jessie

RUN mkdir -p /srv/build
COPY nginx-rtmp-module /srv/build/nginx-rtmp-module
RUN apt-get clean all && apt-get update
RUN apt-get install -y wget gcc make libpcre3-dev libpcre3 libssl-dev
RUN cd /srv/build && \
    wget http://nginx.org/download/nginx-1.10.1.tar.gz && \
    tar xzvf nginx-1.10.1.tar.gz
RUN cd /srv/build/nginx-1.10.1 && \
    ./configure \
    --prefix=/usr \
    --sbin-path=/usr/sbin/nginx \
    --with-http_v2_module \
    --with-http_stub_status_module \
    --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --with-http_ssl_module --add-module=/srv/build/nginx-rtmp-module && \
    make -j4 && \
    make -j4 install
COPY FFmpeg /srv/build/FFmpeg
RUN cd /srv/build/FFmpeg && \
    ./configure \
    --prefix=/usr \
    --enable-libfaac \
    --enable-nonfree \
    --enable-libmp3lame \
    --enable-libspeex \
    --enable-libvpx \
    --enable-librtmp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libwebp \
    --enable-libzimg \
    --enable-openssl && \
    make -j4 && \
    make -j4 install 
