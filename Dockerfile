# 以phusion/passenger-ruby22 镜像为基础
FROM phusion/passenger-ruby22

CMD ["/sbin/my_init"]

# 开放80端口
EXPOSE 80

# 项目目录
VOLUME ["/home/apps/web"]
WORKDIR /home/apps/web

# 设置当前环境变量
ENV HOME /root

# 增加Docker脚本
RUN mkdir -p /etc/my_init.d
COPY docker.sh /etc/my_init.d/docker-script.sh
RUN chmod +x /etc/my_init.d/docker-script.sh

# 设置时区
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# 设置rails环境为生产环境
ENV RAILS_ENV production

# 启动nginx
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

# 清楚产生的缓存文件
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# 快捷命令

# docker rm -f postgres; docker run --name postgres -p 5432:5432 -d postgres

# docker rmi -f pinewong/passenger-ruby22; docker build -t pinewong/passenger-ruby22 .;

# docker rm -f webxx; docker run --name webxx -p 80:80 -v /Users/mac/apps/web/webxx:/home/apps/web --link postgres:postgres -d pinewong/passenger-ruby19;

# docker rm -f webxx; docker run --name webxx -p 80:80 -v /home/apps/webxx:/home/apps/web --link postgres:postgres -d pinewong/passenger-ruby22;


# docker logs -f webxx;

# docker start postgres;
# docker start webxx;
# docker restart webxx;


