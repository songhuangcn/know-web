#!/bin/sh

# echo '/*** Gem源:'
# gem update --system
# gem sources -r https://rubygems.org/ -a https://gems.ruby-china.org/;
# gem install bundle;
# bundle config mirror.https://rubygems.org https://gems.ruby-china.org;
# bundle config mirror.http://rubygems.org https://gems.ruby-china.org;
# bundle config mirror.https://ruby.taobao.org https://gems.ruby-china.org;
# bundle config mirror.http://ruby.taobao.org https://gems.ruby-china.org;
# Bundle

# RUN gem update --system
echo '/*** Bundle Install:';
gem sources -r https://rubygems.org/ -a https://gems.ruby-china.org/;
gem source;
gem install bundler;
bundle config mirror.https://rubygems.org https://gems.ruby-china.org;
bundle install;
rake assets:precompile;

# echo '/*** Bundle install:'
# bundle install;

echo '/*** Rake Db:';
rake db:create;
rake db:migrate;



