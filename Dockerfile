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
COPY docker-script.sh /etc/my_init.d/docker-script.sh
RUN chmod +x /etc/my_init.d/docker-script.sh

# 创建项目目录
VOLUME ['/home/apps/web']
WORKDIR /home/apps/web

# 清楚产生的缓存文件
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
