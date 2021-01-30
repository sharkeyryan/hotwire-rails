#! /bin/bash -l

# Create, load, and seed the databases

function echo_yellow { echo -e "\033[93m## ${1}\033[0m"; }

echo_yellow "Creating Hotwire-Rails database..."
rake db:create

echo_yellow "Loading Hotwire-Rails schema..."
# rake db:schema:load
rake db:migrate

echo_yellow "Seeding Hotwire-Rails database..."
rake db:seed
