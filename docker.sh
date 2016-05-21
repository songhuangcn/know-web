#!/bin/sh

# echo '/*** Gem源:'
# gem update --system
# gem sources -r https://rubygems.org/ -a https://gems.ruby-china.org/;
# gem install bundle;
# bundle config mirror.https://rubygems.org https://gems.ruby-china.org;
# bundle config mirror.http://rubygems.org https://gems.ruby-china.org;
# bundle config mirror.https://ruby.taobao.org https://gems.ruby-china.org;
# bundle config mirror.http://ruby.taobao.org https://gems.ruby-china.org;

# echo '/*** Bundle install:'
# bundle install;

echo '/*** Migrate:'
rake db:create;
rake db:migrate;



