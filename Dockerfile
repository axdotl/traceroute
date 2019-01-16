FROM alpine:latest

COPY entrypoint.sh entrypoint.sh

VOLUME /data

ENTRYPOINT ["/entrypoint.sh"]
