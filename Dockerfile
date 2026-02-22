ARG PG_VERSION=18.2
ARG BASE_IMAGE=ghcr.io/cloudnative-pg/postgresql:${PG_VERSION}-standard-trixie

FROM ${BASE_IMAGE}

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql-18-cron && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /var/log/*

USER 26