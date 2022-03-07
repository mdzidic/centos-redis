# centos-redis
[![Shippable](https://img.shields.io/badge/docker_build-automated-blue.svg)](https://hub.docker.com/r/mdzidic/centos-redis/)
[![](https://images.microbadger.com/badges/image/mdzidic/centos-redis.svg)](https://microbadger.com/images/mdzidic/centos-redis)
[![](https://images.microbadger.com/badges/license/mdzidic/centos-redis.svg)](https://microbadger.com/images/mdzidic/centos-redis)

**NOTE: centos-redis is a relatively old project, official [Redis Docker image](https://hub.docker.com/_/redis) has evolved a lot since my last commit. As such, I've archived this repository.**

A Docker image for [Redis](http://redis.io/), based on [CentOS 7](https://www.centos.org/).

## What is Redis?
Redis is an advanced key-value cache and store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.  

## Features

This image features:

- [CentOS Linux](https://github.com/centos) (latest version)
- [Redis](https://github.com/antirez/redis-io) (version 3.2.4)
- [Gosu](https://github.com/tianon/gosu) (version 1.9)

## Usage

To use this image first build this Dockerfile with this command:  
`docker build --rm=true -t mdzidic/centos-redis .`  

or You can pull the prebuilt image from the Docker Hub Registry:  
`docker pull mdzidic/centos-redis:latest`  

To run container in background use this command:  
`docker run -d --name redis mdzidic/centos-redis`  

## Docker Compose
```yaml
redis:
  image: mdzidic/centos-redis:latest
  ```
