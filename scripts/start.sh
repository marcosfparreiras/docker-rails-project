#!/bin/bash

# if [ "$RAILS_ENV" == "development" ]; then
  # Wait for postgres
  while ! curl db:5432 2>&1 | grep '52'
  do
    sleep 1
  done
  # Initialize Data Base
  # bundle exec rails db:create
  # bundle exec rails db:migrate
  # bundle exec rails db:seed
# fi

rm -f ../tmp/pids/server.pid
# Precompile
if [ "$RAILS_ENV" == "production" ]; then
  bundle exec rails assets:precompile
  bundle exec rails server -e production -b 0.0.0.0 -p 80
fi
# Run server

if [ "$RAILS_ENV" == "development" ]; then
  rm tmp/pids/server.pid
  bundle exec rails server -e development -b 0.0.0.0 -p 80
fi

