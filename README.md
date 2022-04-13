# Sphinx Search Docker

This is an alpine/debian based Sphinx Search 2.3.2 Docker Image

## Tested Environments

I have build and tested the Image on 

- a Raspberry Pi 4 (Raspbian) (alpine)
- a CentOS 7 Server (debian:jessie)

## How To Build

To build the Docker Image run inside the Repository

```bash
docker build -t sphinx-search:2.3.2-alpine .
```
resp.
```bash
cd debian/jessie
docker build -t jrgn/sphinx-search:2.3.2-jessie .
```

## How To Run

To run it, execute for example

```bash
docker run -d --name sphinx-search -p 9306:9306 sphinx-search:2.3.2-alpine
```

or the debian:jessie based image on the Docker Server:

```bash
docker run -d \
  --name sphinx-search \
  -p 9306:9306 \
  -v /opt/srv/sphinx-docker/conf/sphinx.conf:/etc/sphinxsearch/sphinx.conf \
  -v /opt/srv/sphinx-docker/data:/var/data \
  jrgn/sphinx-search:2.3.2-jessie
```

## Install mysql-client into the Container

On the debian:jessie based Container

```bash
docker exec -it sphinx-search /bin/bash
apt-get install -y mysql-client
```

then use 
```bash
mysql -h 127.0.0.1 -P 9306
```
to connect to the Sphinx Search Database.  

You can use 
```sql
show tables;
```
to show the search indexes serving,  

and  

```sql
select * from testrt;
```
to list the indexed documents.

