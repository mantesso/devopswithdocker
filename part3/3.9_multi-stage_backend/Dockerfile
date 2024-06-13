FROM golang:1.16-alpine as build
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server .

FROM scratch
WORKDIR /
COPY --from=build /usr/src/app/server /
ENTRYPOINT ["./server"]
