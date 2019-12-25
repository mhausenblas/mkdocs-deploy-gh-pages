FROM alpine:3.10
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

RUN apk add --no-cache python3 && \
    pip3 install --upgrade pip && \
    pip3 install mkdocs

COPY action.sh /action.sh

ENTRYPOINT ["/action.sh"]
