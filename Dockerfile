FROM golang:1.15
ENV CGO_ENABLED=0
RUN go get -u github.com/yonimoses/prometheus-filter-proxy

FROM alpine:3.12
COPY --from=0 /go/bin/prometheus-filter-proxy /bin/prometheus-filter-proxy
ENTRYPOINT ["prometheus-filter-proxy"]
