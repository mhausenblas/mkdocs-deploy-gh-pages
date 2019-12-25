FROM alpine:3.10
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

COPY action.sh /action.sh

RUN apk add --no-cache python3 bash git && \
    pip3 install --upgrade pip && \
    pip3 install mkdocs && \
    chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
