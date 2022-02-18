FROM public.ecr.aws/b7r0k8v0/mkdocs-material:latest
LABEL maintainer="Steve Zuar, dev@zuar.com"

COPY action.sh /action.sh

RUN apk add --no-cache bash && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
