FROM golang:1.19-alpine

WORKDIR /app

COPY . .

RUN go mod tidy

CMD ["./entrypoint.sh"]

ENTRYPOINT [ "go", "run", "." ]