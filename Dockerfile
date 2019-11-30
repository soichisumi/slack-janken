FROM golang:1.13 as builder

COPY . /go/src/tmp
WORKDIR /go/src/tmp
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o exe

FROM alpine:3
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/tmp/exe /exe

CMD ["/exe"]