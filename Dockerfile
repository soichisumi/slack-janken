FROM golang:1.13 as builder

COPY go.* ./
RUN go mod download
COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o exe

FROM alpine:3
RUN apk add --no-cache ca-certificates
COPY --from=builder exe /exe

CMD ["/server"]