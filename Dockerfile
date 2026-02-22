ARG PG_VERSION=16.12
ARG PG_MAJOR=16
ARG BASE_IMAGE=ghcr.io/cloudnative-pg/postgresql:${PG_VERSION}-standard-bookworm

FROM ${BASE_IMAGE}

ARG PG_MAJOR

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql-${PG_MAJOR}-cron && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /var/log/*

USER 26