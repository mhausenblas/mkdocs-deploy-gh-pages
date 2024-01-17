FROM python:3.11-alpine3.18
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

RUN apk add --no-cache git git-fast-import openssh build-base
WORKDIR /docs

COPY action.sh /action.sh

RUN apk add --no-cache bash build-base && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
