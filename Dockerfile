# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.4.3
FROM ruby:${RUBY_VERSION}

# --- OS deps for common Rails gems + dev workflows ---
# (pg, nokogiri, image processing, etc.)
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  git \
  curl \
  ca-certificates \
  libpq-dev \
  pkg-config \
  libyaml-dev \
  tzdata \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

# --- Bundler config ---
ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    GEM_HOME=/usr/local/bundle \
    PATH=/usr/local/bundle/bin:$PATH

WORKDIR /app

# Install gems first (better layer caching)
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy app (in dev you'll usually bind-mount over this)
COPY . .

# Rails dev defaults
ENV RAILS_ENV=development \
    RACK_ENV=development \
    BUNDLE_WITHOUT=""

EXPOSE 3000

# In dev we usually run migrations manually or from an entrypoint script.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

