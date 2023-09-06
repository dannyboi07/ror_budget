FROM ruby:3.1.2-alpine

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apk add --no-cache --update build-base \
    && apk add --no-cache tzdata \
    && apk add --no-cache libpq-dev \
    && bundle install --retry=3 \
    && apk del build-base

COPY . .

# ENTRYPOINT [ "bundle", "exec", "puma", "-C", "config/puma.rb", "config.ru"]
ENTRYPOINT ["sh", "./bin/docker.app.entry.sh"]