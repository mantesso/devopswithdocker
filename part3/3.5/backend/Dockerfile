FROM golang:1.16
WORKDIR /usr/src/app
COPY . .
RUN go build
EXPOSE 8080
RUN useradd -m appuser
RUN chown appuser .
USER appuser
CMD ./server