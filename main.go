package main

import (
	"log"
	"net/http"
)

func response(w http.ResponseWriter, r *http.Request) {
	_, err := w.Write([]byte(`Hello world`))
	if err != nil {
		return
	}
}

func debug(w http.ResponseWriter, r *http.Request) {
	// loggor.setlevel(debug)
}

func main() {
	http.HandleFunc("/", response)
	http.HandleFunc("/debug", debug)

	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err.Error())
	}
}
