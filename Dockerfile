FROM squidfunk/mkdocs-material:9.5.10
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"

COPY action.sh /action.sh

RUN apk add --no-cache bash build-base linux-headers gcc python3-dev && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
