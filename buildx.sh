CO_VER=1.9.1
SY_VER=1.8.1
RS_VER=1.9.0
DB_VER=1.9.1
SF_VER=1.9.0
BQ_VER=1.9.1

# docker login
# docker buildx create --use --name mybuilder && \
# docker run --pull always --privileged --rm tonistiigi/binfmt --install all
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:master --use
docker buildx create --name mybuilder --driver-opt image=moby/buildkit:buildx-stable-1 --use

# Synapse
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-synapse${SY_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-synapse \
  -t xemuliam/dbt:synapse \
  --build-arg PLUGINS='core=='${CO_VER}',synapse=='${SY_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# Redshift
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-redshift${RS_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-redshift \
  -t xemuliam/dbt:redshift \
  --build-arg PLUGINS='core=='${CO_VER}',redshift=='${RS_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# Databricks
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-databricks${DB_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-databricks \
  -t xemuliam/dbt:databricks \
  --build-arg PLUGINS='core=='${CO_VER}',databricks=='${DB_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# Snowflake
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-snowflake${SF_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-snowflake \
  -t xemuliam/dbt:snowflake \
  --build-arg PLUGINS='core=='${CO_VER}',snowflake=='${SF_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

# BigQuery
docker buildx build --platform linux/amd64,linux/arm64 \
  -t xemuliam/dbt:${CO_VER}-bigquery${BQ_VER} \
  -t xemuliam/dbt:$(echo $CO_VER | cut -d. -f 1,2)-bigquery \
  -t xemuliam/dbt:bigquery \
  --build-arg PLUGINS='core=='${CO_VER}',bigquery=='${BQ_VER} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal

docker buildx rm -f && docker buildx prune -f
