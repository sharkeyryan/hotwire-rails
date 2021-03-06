FROM ruby:2.7.2 AS base

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
COPY . $APP_HOME/
WORKDIR $APP_HOME

RUN grep security /etc/apt/sources.list | tee /etc/apt/security.sources.list \
  && apt-get update \
  && apt-get upgrade -y -o Dir::Etc::SourceList=/etc/apt/security.sources.list

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -y --allow-unauthenticated \
  nodejs \
  yarn \
  gnutls-bin \
  nano \
  && rm -r /var/lib/apt/lists/*

RUN bundle config set with 'development test'

RUN apt-get update -qq \
  && bundle install --jobs 4

ENV RAILS_ENV production
RUN bin/setup-docker
