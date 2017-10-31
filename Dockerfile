FROM ubuntu:xenial
LABEL Maintainer="bpicode"

ARG go_version=1.9.2

RUN apt-get update && apt-get install -y make wget git dpkg-sig curl zip ruby ruby-dev rubygems gcc make rpm

RUN wget --quiet https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz
RUN tar -xf go${go_version}.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOPATH=/root/go
ENV GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN gem install --no-ri --no-rdoc fpm
    