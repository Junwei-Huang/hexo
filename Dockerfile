FROM centos:7.3.1611
LABEL author=mratrend email=mratrend@163.com
WORKDIR /root
RUN yum install -y  epel-release && \
yum install git-core -y && \
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
yum install -y nodejs && npm config set registry https://registry.npm.taobao.org \
&& npm install hexo-cli -g  && hexo init blog && cd blog && npm install && \
yum clean all && rm -rf /var/cache/yum/*
WORKDIR blog
EXPOSE 4000
ENTRYPOINT ["hexo","server"]
