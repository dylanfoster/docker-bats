FROM dylanfoster/docker

ENV BATS_VERSION 0.4.0

USER root

RUN apk add --no-cache bash curl make \
 && curl -sSL "https://github.com/sstephenson/bats/archive/v${BATS_VERSION}.tar.gz" \
          -o "/tmp/v${BATS_VERSION}.tar.gz" \
 && tar -zxvf "/tmp/v${BATS_VERSION}.tar.gz" -C /tmp/ \
 && bash "/tmp/bats-${BATS_VERSION}/install.sh" /usr/local \
 && rm -rf /tmp/* \
 && apk del curl make

ENTRYPOINT ["/usr/local/bin/bats"]
