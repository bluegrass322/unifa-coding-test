FROM ruby:3.0

RUN apt-get update -qq && apt-get install -y \
    nodejs\
    npm \
    postgresql-client \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install


EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
