FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY yarn.lock /myapp/yarn.lock
COPY package.json /myapp/package.json
RUN bundle install
COPY . /myapp