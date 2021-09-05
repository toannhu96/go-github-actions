package main

import (
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/", hello)
	log.Println("Server is starting at port 8081...")
	http.ListenAndServe(":8081", r)
}

func hello(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello world from go-github-actions"))
}
