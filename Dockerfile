FROM public.ecr.aws/zuar/zmkdocs:latest
LABEL maintainer="Steve Zuar, dev@zuar.com"

COPY action.sh /action.sh

RUN apk add --no-cache bash && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
