FROM debian:jessie

MAINTAINER jalbersdorfer <jalbersdorfer@gmail.com>

RUN apt-get update \
    && apt-get install -y wget libexpat1 libmysqlclient18 libodbc1 libpq5 mysql-common \
           libltdl7 libgssapi-krb5-2 libldap-2.4-2 libk5crypto3 libkeyutils1 libkrb5-3 \
           libkrb5support0 libsasl2-2 libsasl2-modules-db libsasl2-modules \
    && cd /tmp \
    && mkdir -p /var/data \
    && wget http://sphinxsearch.com/files/sphinxsearch_2.3.2-beta-1~jessie_amd64.deb \
    && dpkg -i sphinxsearch_2.3.2-beta-1~jessie_amd64.deb

EXPOSE 9312 9306

ENTRYPOINT ["searchd", "--nodetach"]

