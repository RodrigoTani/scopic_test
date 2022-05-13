FROM ruby:3.1.0-alpine
ARG INSTALL_PATH

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apk update && \
    apk add bash \
    build-base \
    busybox \
    chromium \
    chromium-chromedriver \
    curl \
    dbus \
    freetds-dev \
    g++ \
    gcc \
    git \
    libexif \
    libxml2-dev \
    libxslt-dev \
    make \
    mesa-dri-swrast \
    musl-dev \
    postgresql-contrib \
    postgresql-dev \
    postgresql-libs \
    ttf-freefont \
    tzdata \
    udev \
    wait4ports \
    xorg-server \
    xvfb \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache --quiet build-base

# Set timezone
RUN cp /usr/share/zoneinfo/Brazil/East /etc/localtime

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# install required gem files for Capybara
COPY Gemfile ./
COPY Gemfile.lock ./

RUN gem install bundler:2.3.6
RUN bundle install

COPY . .