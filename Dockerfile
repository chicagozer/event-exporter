FROM golang:1.9.2-alpine3.7

ENV SRC_PATH $GOPATH/src/github.com/chicagozer/event-exporter
RUN apk add --no-cache make
ADD . $SRC_PATH/
RUN echo $GOPATH && echo $SRC_PATH && cd $SRC_PATH && make build


FROM alpine:3.7
COPY --from=0 /go/src/github.com/chicagozer/event-exporter/bin/event-exporter /
CMD ["/event-exporter", "-v", "4"]
