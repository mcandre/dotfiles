FROM golang:1.23.2-alpine AS build

WORKDIR /src
RUN apk add --no-cache git
COPY . .
RUN CGO_ENABLED=0 go build -ldflags "-w -s -extldflags '-static' -X main.version=$(git describe --always --dirty --tags)" ./cmd/shfmt

FROM alpine:3.20.3 AS alpine
COPY --from=build /src/shfmt /bin/shfmt
COPY "./cmd/shfmt/docker-entrypoint.sh" "/init"
ENTRYPOINT ["/init"]

FROM scratch
COPY --from=build /src/shfmt /bin/shfmt
ENTRYPOINT ["/bin/shfmt"]
CMD ["-h"]
