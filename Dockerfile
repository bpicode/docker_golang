FROM ubuntu:bionic
LABEL Maintainer="bpicode"

ARG go_version=1.13.5
ARG fpm_version=1.11.0
ARG jfrogcli_version=1.31.2
ARG githubcli_version=2.13.0

RUN apt-get update && apt-get install --no-install-recommends -y make wget git dpkg-sig curl zip ruby ruby-dev rubygems autoconf automake libtool libltdl-dev build-essential gcc rpm && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://dl.google.com/go/go${go_version}.linux-amd64.tar.gz | tar xvz -C /usr/local
ENV GOPATH=/root/go
ENV GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN gem install --no-ri --no-rdoc fpm -v ${fpm_version}

RUN wget -qO- https://jfrog.bintray.com/jfrog-cli-go/${jfrogcli_version}/jfrog-cli-linux-amd64/jfrog -O /usr/local/bin/jfrog && chmod 755 /usr/local/bin/jfrog

RUN wget -q https://github.com/github/hub/releases/download/v${githubcli_version}/hub-linux-amd64-${githubcli_version}.tgz -O - | tar xvz -C /tmp/  && /tmp/hub-linux-amd64-${githubcli_version}/./install && rm -rf /tmp/hub-linux-amd64-${githubcli_version}/
