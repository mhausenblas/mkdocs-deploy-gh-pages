FROM python:3.11-alpine3.18
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

WORKDIR /docs

COPY action.sh /action.sh

RUN apk add --no-cache bash git git-fast-import openssh build-base && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
