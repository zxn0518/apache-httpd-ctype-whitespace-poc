FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 安装构建依赖
RUN apt update && apt install -y \
    build-essential \
    curl \
    git \
    autoconf \
    libtool \
    pkgconf \
    libpcre3-dev \
    libssl-dev \
    libapr1-dev \
    libaprutil1-dev
RUN apt-get install -y make autoconf automake libtool wget \
                                         uuid-dev pkg-config libtool-bin \
                                         libbsd-dev

# 克隆最新 Apache httpd 主线代码
RUN git clone https://github.com/apache/httpd.git /httpd && \
    git clone --depth=1 https://github.com/apache/apr.git httpd/srclib/apr && \
    git clone --depth=1 https://github.com/apache/apr-util.git httpd/srclib/apr-util

WORKDIR /httpd

RUN ./buildconf

RUN ./configure --enable-mods-shared=all && \
    make -j$(nproc) && \
    make install

RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

ENV PATH="/usr/local/apache2/bin:${PATH}"

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND", "-f", "/usr/local/apache2/conf/httpd.conf", "-e", "debug"]
