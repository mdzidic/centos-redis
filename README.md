# centos-redis

A Docker image for [Redis](http://redis.io/), based on [CentOS 7](https://www.centos.org/).

## Features

This image features:

- [CentOS Linux](https://github.com/centos) v7
- [Redis](https://github.com/antirez/redis-io) v3.2.4
- [Gosu](https://github.com/tianon/gosu) v1.9

## Usage

To use this image first build this Dockerfile with this command **`docker build --rm=true -t mdzidic/centos-redis .`** and simply run container executing **`docker run --name redis mdzidic/centos-redis`** .
