FROM golang:1.24-alpine AS builder

# set env vars
ENV APP_ENV=production \
    APP_PORT=8080 \
    DEBUG=false

# workdir
WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /app/main .

COPY --from=builder /app/index.html .

EXPOSE 8080
EXPOSE 9090

# default command
CMD ["./main"]
