FROM alpine

MAINTAINER jalbersdorfer <jalbersdorfer@gmail.com>

COPY ./sphinx-alpine.patch /tmp/sphinx-alpine.patch

RUN apk add gcc g++ make libc-dev mariadb-dev \
    && cd /tmp \
    && mkdir -p /var/data \
    && wget http://sphinxsearch.com/files/sphinx-2.3.2-beta.tar.gz \
    && tar -xzf sphinx-2.3.2-beta.tar.gz \
    && cd sphinx-2.3.2-beta \
    && cp ../sphinx-alpine.patch . \
    && patch -p 1 -i sphinx-alpine.patch \
    && ./configure \
    && make -j4 \
    && make install

COPY ./sphinx.conf /usr/local/etc/sphinx.conf

EXPOSE 9312 9306

ENTRYPOINT ["searchd", "--nodetach"]

