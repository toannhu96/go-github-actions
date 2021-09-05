# Multistage docker
FROM golang:1.16-alpine AS builder

WORKDIR /src

COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download || true

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

RUN CGO_ENABLED=0 go build -o /bin/demo

FROM alpine:3.10

RUN apk --no-cache add ca-certificates tzdata htop bash
# Change timezone to Asia/Ho_Chi_Minh
RUN rm -rf /etc/localtime\
    && cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

COPY --from=builder /bin/demo /bin/demo

EXPOSE 8081

ENTRYPOINT ["/bin/demo"]
