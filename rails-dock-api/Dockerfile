FROM ruby:2.7.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler:2.2.22

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle config --global frozen 1
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]