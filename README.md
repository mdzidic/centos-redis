# centos-redis

A Docker image for [Redis](http://redis.io/), based on [CentOS 7](https://www.centos.org/).

## What is Redis?

## Features

This image features:

- [CentOS Linux](https://github.com/centos) v7
- [Redis](https://github.com/antirez/redis-io) v3.2.4
- [Gosu](https://github.com/tianon/gosu) v1.9

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
