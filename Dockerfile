FROM golang:1.20.4-alpine AS builder

WORKDIR /app
COPY fullcycle.go fullcycle.go
RUN go build fullcycle.go

FROM scratch
COPY --from=builder /app .

ENTRYPOINT [ "./fullcycle" ]