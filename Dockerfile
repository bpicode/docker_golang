FROM ubuntu:xenial
LABEL Maintainer="bpicode"

ARG go_version=1.10
ARG fpm_version=1.9.3

RUN apt-get update && apt-get install --no-install-recommends -y make wget git dpkg-sig curl zip ruby ruby-dev rubygems autoconf automake libtool libltdl-dev build-essential gcc rpm && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz | tar xvz -C /usr/local
ENV GOPATH=/root/go
ENV GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN gem install --no-ri --no-rdoc fpm -v ${fpm_version}
