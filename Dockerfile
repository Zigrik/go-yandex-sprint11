FROM golang:1.23.1 
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go *.db ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app
CMD ["/my_app"]