#!/bin/sh

echo '/*** Gem源:'
gem update --system
gem -v
gem sources -r http://mirrors.aliyun.com/rubygems/ -a https://gems.ruby-china.org/;
gem install bundle;
bundle config mirror.https://rubygems.org https://gems.ruby-china.org;
bundle config mirror.http://rubygems.org https://gems.ruby-china.org;
bundle config mirror.https://ruby.taobao.org https://gems.ruby-china.org;
bundle config mirror.http://ruby.taobao.org https://gems.ruby-china.org;

echo '/*** Bundle install:'
bundle install;

echo '/*** Migrate:'
rake db:create;
rake db:migrate;

echo '/*** 添加环境、配置文件cp nginx-env.conf, nginx.conf:'
cp nginx-env.conf /etc/nginx/main.d/nginx-env.conf;
cp nginx.conf /etc/nginx/sites-enabled/nginx.conf;





