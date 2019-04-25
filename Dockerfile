FROM alpine:3.5
RUN apk --update --no-cache add strace
ADD ./src/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
