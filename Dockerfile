FROM postgres:10
ENV PG_REPACK_VERSION 1.4.3
WORKDIR /pg_repack

RUN set -x \
 && buildDeps=" \
        build-essential \
        postgresql-server-dev-${PG_MAJOR} \
        curl \
        unzip \
        ca-certificates \
        libssl-dev \
        zlib1g-dev \
    " \
 && apt-get update -yqq \
 && apt-get install -yqq --no-install-recommends \
        $buildDeps \
 && curl -o pg_repack.zip -isL http://api.pgxn.org/dist/pg_repack/${PG_REPACK_VERSION}/pg_repack-${PG_REPACK_VERSION}.zip \
 && unzip pg_repack.zip || true \
 && rm pg_repack.zip \
 && cd pg_repack-${PG_REPACK_VERSION} \
 && make \
 && make install \
 && apt-get remove --purge -yqq $buildDeps \
 && apt-get clean \
 && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

ENTRYPOINT ["pg_repack"]
