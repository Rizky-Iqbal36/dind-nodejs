ARG DOCKER_VERSION=latest
FROM docker:${DOCKER_VERSION}

ARG COMPOSE_VERSION=
ARG DOCKER_VERSION

RUN apk add --no-cache py3-pip python3
RUN apk add --no-cache --virtual \
  build-dependencies \
  cargo \
  gcc \
  libc-dev \
  libffi-dev \
  make \
  openssl-dev \
  python3-dev \
  rust \
  && pip3 install --no-cache-dir "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}" \
  && apk del build-dependencies
RUN apk add --update nodejs npm
RUN npm -v && node -v

LABEL \
  org.opencontainers.image.authors="Rizky Iqbal <rizkiiqbal36@gmail.com>" \
  org.opencontainers.image.description="This docker image installs docker-compose and nodejs on top of the docker image." \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.title="Docker Compose and nodejs on docker base image" \
  org.opencontainers.image.source="https://github.com/Rizky-Iqbal36/dind-nodejs"\
  org.opencontainers.image.version="${DOCKER_VERSION} with docker-compose ${COMPOSE_VERSION}"
