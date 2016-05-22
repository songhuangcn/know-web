# 以phusion/passenger-ruby22镜像为基础
FROM phusion/passenger-ruby22

CMD ["/sbin/my_init"]

# 开放80端口
EXPOSE 80

# 设置时区
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

#设置当前环境变量
ENV HOME /root
#设置rails环境为生产环境
ENV RAILS_ENV production

# 缓存gem，如果Gemfil没有改变将不会从源直接下载
WORKDIR /tmp
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock

# Bundle
# RUN gem update --system
RUN gem sources -r https://rubygems.org/ -a https://gems.ruby-china.org/
RUN gem install bundler
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org
RUN bundle install
RUN gem source

#启动nginx
RUN rm -f /etc/service/nginx/down

#配置nginx
RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/sites-enabled/webapp.conf

#添加环境文件
COPY nginx-env.conf /etc/nginx/main.d/nginx-env.conf

#增加初始化运行脚本
RUN mkdir -p /etc/my_init.d

#docker
COPY docker.sh /etc/my_init.d/docker.sh
RUN chmod +x /etc/my_init.d/docker.sh

# 创建项目目录
RUN mkdir /home/apps/web
# 将项目文件加入项目目录
COPY . /home/apps/web

WORKDIR /home/apps/web
# 编译静态文件
RUN rake assets:precompile

# 清楚产生的缓存文件
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
