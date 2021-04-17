FROM        python:3.8-slim-buster AS base
ENV         DBT_HOME=/usr/app \
            PYTHONIOENCODING=utf-8

FROM        base AS build
ARG         DIST_MIRROR=https://github.com/fishtown-analytics/dbt/archive/refs/tags
ARG         VERSION=0.19.1
ARG         PLUGINS=''
RUN         mkdir -p ${DBT_HOME} && \
            apt update && \
            apt install -y --no-install-recommends \
                software-properties-common \
                make \
                build-essential \
                libpq-dev \
                curl && \
            pip install --no-cache-dir --upgrade pip setuptools wheel && \
            curl -L ${DIST_MIRROR}/v${VERSION}.tar.gz | tar xvz -C ${DBT_HOME} && \
            mv ${DBT_HOME}/dbt-${VERSION}/* ${DBT_HOME} && \
            rm -f *.tar.gz && rm -rf ${DBT_HOME}/dbt-${VERSION} && \
            cd ${DBT_HOME} && \
            if [ ! -z "$PLUGINS" ]; then sed -i '/'$( \
                echo 'core '$PLUGINS | \
                sed -e 's/\s/,/g' -e 's/\(,\)*/\1/g' -e 's/,/\\\|/g' \
                )'/!d' requirements.txt; fi && \
            pip wheel --wheel-dir ${DBT_HOME}/wheels \
                --find-links ${DBT_HOME}/wheels \
                --requirement requirements.txt

FROM        base
COPY        --from=build ${DBT_HOME} ${DBT_HOME}
RUN         cd ${DBT_HOME} && \
            pip --no-cache-dir install \
                --find-links ${DBT_HOME}/wheels \
                --no-index -r requirements.txt
WORKDIR     ${DBT_HOME}
VOLUME      ${DBT_HOME}
CMD         ["dbt", "--version"]
