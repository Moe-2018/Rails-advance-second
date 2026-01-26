# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.3.8

FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

RUN sudo apt-get update --fix-missing && export DEBIAN_FRONTEND=noninteractive \
	&& sudo apt-get -y install --no-install-recommends \
	build-essential make gcc g++ git openssh-client \
	libpq-dev \
	redis-server