# go-github-actions

Simple go rest service with github actions to push image to docker hub and deploy to server

## Build and run local

```console
$ docker build -t go-github-actions .
$ docker run -d --rm --name go-container -p 8081:8081 go-github-actions
```
