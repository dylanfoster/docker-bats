FROM bats/bats

ENV DOCKER_VERSION 24.0.5

RUN apk add --no-cache curl \
      && curl -fsSl "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
      -o "docker-${DOCKER_VERSION}.tgz" \
      && tar zxvf "docker-${DOCKER_VERSION}.tgz" \
      && mv docker/* /usr/bin/ \
      && rm "docker-${DOCKER_VERSION}.tgz" \
      && apk del curl
