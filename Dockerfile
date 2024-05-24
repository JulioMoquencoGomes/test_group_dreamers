FROM ruby:3.1
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN mkdir /test_group_dreamers
WORKDIR /test_group_dreamers
COPY Gemfile /test_group_dreamers/Gemfile
#COPY Gemfile.lock /test_group_dreamers/Gemfile.lock
RUN bundle install
COPY . /test_group_dreamers