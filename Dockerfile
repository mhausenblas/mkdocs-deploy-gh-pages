FROM alpine:3.10
LABEL maintainer="Michael Hausenblas, hausenbl@amazon.com"
LABEL "com.github.actions.name"="MkDocs Deploy GitHub Pages"
LABEL "com.github.actions.description"="Deploy an MkDocs site to GitHub Pages"
LABEL "com.github.actions.icon"="arrow-up-circle"
LABEL "com.github.actions.color"="orange"

RUN apk add --no-cache python3 && \
    pip3 install --upgrade pip && \
    pip3 install mkdocs

COPY action.sh /action.sh

ENTRYPOINT ["/action.sh"]
