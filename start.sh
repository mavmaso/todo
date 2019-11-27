bundle check || bundle install
yarn
bundle exec puma -C config/puma.rb