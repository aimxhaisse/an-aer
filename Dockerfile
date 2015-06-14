FROM ubuntu:15.04
MAINTAINER Sebastien Rannou <mxs@sbrk.org> (@aimxhaisse)

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -q -y \
    nodejs \
    build-essential \
    npm \
    ruby-dev \
    rubygems

RUN gem install bundle

ADD . /usr/src/app

RUN ln -sf /usr/bin/nodejs /usr/bin/node
RUN cd /usr/src/app && bundle install
RUN cd /usr/src/app && npm install
RUN npm install -g grunt-cli

CMD /bin/bash
