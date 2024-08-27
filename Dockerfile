FROM alpine:3 as builder

ENV BATS_CORE_VERSION 1.11.0
ENV BATS_SUPPORT_VERSION 0.3.0
ENV BATS_ASSERT_VERSION 2.1.0
ENV BATS_FILE_VERSION 0.4.0

RUN apk add --no-cache curl

WORKDIR /tmp

RUN curl -fsSL https://github.com/bats-core/bats-core/archive/v${BATS_CORE_VERSION}.tar.gz | tar xzv
RUN curl -fsSL https://github.com/bats-core/bats-support/archive/v${BATS_SUPPORT_VERSION}.tar.gz | tar xzv
RUN curl -fsSL https://github.com/bats-core/bats-assert/archive/v${BATS_ASSERT_VERSION}.tar.gz | tar xzv
RUN curl -fsSL https://github.com/bats-core/bats-file/archive/v${BATS_FILE_VERSION}.tar.gz | tar xzv

FROM docker:24

RUN apk add --no-cache bash

COPY --from=builder /tmp/bats-core-* /opt/bats-core
COPY --from=builder /tmp/bats-support-* /opt/bats-support
COPY --from=builder /tmp/bats-assert-* /opt/bats-assert
COPY --from=builder /tmp/bats-file-* /opt/bats-file

RUN ln -s /opt/bats-core/bin/bats /usr/local/bin/bats

WORKDIR /code

ENTRYPOINT ["/usr/local/bin/bats"]
CMD ["--help"]
