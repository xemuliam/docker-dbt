CO_VER=1.7.11
RS_VER=1.7.5
SF_VER=1.7.3
SY_VER=1.7.1
BQ_VER=1.7.7

docker buildx create --use --name mybuilder && \
docker run --pull always --privileged --rm tonistiigi/binfmt --install all

# Redshift
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-redshift${RS_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-redshift \
  -t xemuliam/dbt:redshift \
  --build-arg PLUGINS='core=='${CO_VER}',redshift=='${RS_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# Snowflake
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-snowflake${SF_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-snowflake \
  -t xemuliam/dbt:snowflake \
  --build-arg PLUGINS='core=='${CO_VER}',snowflake=='${SF_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# Synapse
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-synapse${SY_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-synapse \
  -t xemuliam/dbt:synapse \
  --build-arg PLUGINS='core=='${CO_VER}',synapse=='${SY_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# BigQuery
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-bigquery${BQ_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-bigquery \
  -t xemuliam/dbt:bigquery \
  --build-arg PLUGINS='core=='${CO_VER}',bigquery=='${BQ_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

docker buildx rm -f && docker buildx prune -f
