FROM ubuntu:15.04
MAINTAINER Sebastien Rannou <mxs@sbrk.org> (@aimxhaisse)

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -q -y \
    nodejs \
    build-essential \
    npm
