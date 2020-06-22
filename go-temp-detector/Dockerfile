# Start from golang base image
FROM golang:alpine as builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

# Set the current working directory inside the container 
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download


# Copy the source from the current directory to the working Directory inside the container 
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o temp .

# Start a new stage from scratch
FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/
# Copy the Pre-built binary file from the previous stage. Observe we also copied the .env file
COPY --from=builder /app/temp .
COPY --from=builder /app/.env .  

#Command to run the executable
CMD ["./temp"]