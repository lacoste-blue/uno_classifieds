# Base image to use:
# Similar to: https://github.com/docker-library/ruby/blob/a6918175fd506b46bf2d8f899f4faa40e72296fb/2.3/jessie/Dockerfile
FROM ruby:2.3.3

# Update the machine and install rails dependencies.
RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

# Create a directory to house the application. Linux convention is /opt
RUN mkdir -p /opt/uno_classifieds
# Change to that directory.
WORKDIR /opt/uno_classifieds

# Copy over the source code from the local machine to the container.
COPY . /opt/uno_classifieds

# Install required gems.
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test
# Specify some production level settings pertaining to assets.
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
# Precompile assets.
RUN bundle exec rake assets:precompile

# The port the container will expose.
EXPOSE 3000

# The command to run the application.
CMD bundle exec puma -C config/puma.rb
