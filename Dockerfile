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

WORKDIR /usr/src/app

ADD package.json /usr/src/app/
ADD Gemfile Gemfile.lock /usr/src/app/
ADD Gruntfile.coffee /usr/src/app/

RUN ln -sf /usr/bin/nodejs /usr/bin/node
RUN bundle install
RUN npm install
RUN npm install -g grunt-cli

ADD . /usr/src/app

CMD grunt serve
