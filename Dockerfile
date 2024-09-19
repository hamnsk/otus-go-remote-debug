FROM golang:1.23.0-alpine AS build
WORKDIR /debug
ADD . /debug

RUN go clean --modcache && \
    GOBIN=/go/bin CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go install -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv && \
    CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -gcflags "all=-N -l" -o ./app  && \
    chmod +x /debug/app && chmod +x /go/bin/dlv

FROM scratch
COPY --from=build /go/bin/dlv /dlv
COPY --from=build /debug/app /app
ENTRYPOINT [ "/dlv" ]