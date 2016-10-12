FROM centos:centos7

# Basics
RUN yum -y install epel-release
RUN yum -y install wget curl vim tar make gcc tcl

# TERM fix
RUN echo "export TERM=xterm" >> ~/.bashrc

RUN groupadd -r redis && useradd -r -g redis redis

# Gosu
# Setup gosu for easier command execution
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -rf /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

# Redis
RUN wget http://download.redis.io/releases/redis-3.2.4.tar.gz \
    && mkdir -p /usr/src/redis \
    && tar -xzf redis-3.2.4.tar.gz -C /usr/src/redis --strip-components=1 \
    && rm -rf redis-3.2.4.tar.gz \
    && make -C /usr/src/redis \
    && make -C /usr/src/redis install \
    && mkdir -p /etc/redis \
    && mkdir -p /var/log/redis \
    && mkdir /data \
    && cp /usr/src/redis/redis.conf /etc/redis \
    && cp /usr/src/redis/sentinel.conf /etc/redis \
    && sed 's/^bind 127.0.0.1/bind 0.0.0.0/' -i /etc/redis/redis.conf \
    && sed 's/^# unixsocket /unixsocket /' -i /etc/redis/redis.conf \
    && sed 's/^# unixsocketperm 700/unixsocketperm 777/' -i /etc/redis/redis.conf \
    && sed 's/^protected-mode yes/protected-mode no/' -i /etc/redis/redis.conf \
    && sed 's/^dir .\//dir \/data/' -i /etc/redis/redis.conf \
    && sed 's/^logfile ""/logfile "\/var\/log\/redis\/redis.log"/' -i /etc/redis/redis.conf \
    && chown -R redis:redis /data \
    && chown -R redis:redis /var/log/redis \
    && chown -R redis:redis /etc/redis \
    && rm -rf /usr/src/redis

ADD ./files/entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

VOLUME ["/data","/var/log/redis"]
EXPOSE 5900

ENTRYPOINT ["/tmp/entrypoint.sh"]

CMD ["/etc/redis/redis.conf"]
