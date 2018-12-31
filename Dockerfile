FROM ruby:2.6
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update -qq && \
    apt-get install -y build-essential libpq-dev apt-utils mysql-client vim curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install nodejs && \
    apt-get update && apt-get install -y yarn
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install -j4
COPY . /myapp
RUN yarn install --ignore-engines