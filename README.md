# Sphinx Search Docker

This is an alpine based Sphinx Search 2.3.2 Docker Image

## Tested Environments

I have build and tested the Image on 

- a Raspberry Pi 4 (Raspbian)

## How To Build

To build the Docker Image run inside the Repository

```bash
docker build -t sphinx-search:2.3.2-alpine .
```

## How To Run

To run it, execute for example

```bash
docker run -d --name sphinx-search -p 9306:9306 sphinx-search:2.3.2-alpine
```
