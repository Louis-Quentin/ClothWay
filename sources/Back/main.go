package main

import (
	"net/http"
	"fmt"
)

const port = ":8080"

func Home(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, world")
}



func main() {
	http.HandleFunc("/", Home)

	http.ListenAndServe(port, nil)
}