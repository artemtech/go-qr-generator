FROM golang:1.21 AS builder
LABEL maintainer="Sam Wierema <mail@samwierema.nl>,Sofyan Sugianto <sofyan@artemtech.id>"
WORKDIR /app
COPY go.mod go.sum main.go .
RUN go build -o qrcode-web .

FROM debian:12-slim AS final
ENV TZ=Asia/Jakarta
COPY --from=builder /app/qrcode-web /qrcode-web

EXPOSE 8080

ENTRYPOINT /qrcode-web
