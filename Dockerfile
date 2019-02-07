FROM ubuntu:latest

MAINTAINER Andrew Edwards <ae0000@gmail.com>

ENV GOVERSION 1.11.5

RUN apt-get update
RUN apt-get install -y wget git gcc python jq curl

RUN wget -P /tmp https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf /tmp/go${GOVERSION}.linux-amd64.tar.gz
RUN rm /tmp/go${GOVERSION}.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install -y nodejs


WORKDIR $GOPATH
