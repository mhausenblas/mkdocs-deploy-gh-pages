FROM python:3.8.1-alpine3.11
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

RUN apk add --no-cache git git-fast-import openssh build-base
WORKDIR /docs

COPY action.sh /action.sh

RUN apk add --no-cache bash build-base && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
