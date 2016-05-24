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
echo '/*** Gem Source:';
gem sources -r https://rubygems.org/ -a https://gems.ruby-china.org/;
gem source;

echo '/*** Bundle Install:';
gem install bundler;
bundle config mirror.https://rubygems.org https://gems.ruby-china.org;
bundle install;


echo '/*** Rake Asset:';
rake assets:precompile;

# echo '/*** Bundle install:'
# bundle install;

echo '/*** Rake Db:';
rake db:create;
rake db:migrate;

# docker rm -f webxx; docker run --name webxx --link postgres -v /home/apps/webxx:/home/apps/web -p 80:80 -d pinewong/passenger-ruby22;

# docker rm -f webxx; docker run --name webxx --link postgres -v /Users/mac/apps/web/webxx:/home/apps/web -p 80:80 -d pinewong/passenger-ruby22;

# docker rmi -f pinewong/passenger-ruby22; docker build -t pinewong/passenger-ruby22 .;


