FROM docker
RUN apk add --no-cache bash git docker-cli
WORKDIR /usr/src/app
COPY download_push.sh .
RUN chmod a+x download_push.sh
ENTRYPOINT ["./download_push.sh"]