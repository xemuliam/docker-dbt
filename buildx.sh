      core_ver=1.11.11

   synapse_ver=1.8.5
    athena_ver=1.10.1
  redshift_ver=1.10.1
databricks_ver=1.12.0
 snowflake_ver=1.11.5
  bigquery_ver=1.11.1
    duckdb_ver=1.10.1

docker login
docker buildx create --use --name mybuilder && \
docker run --pull always --privileged --rm tonistiigi/binfmt --install all
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:master --use
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:buildx-stable-1 --use

for plugin in databricks; do
# for plugin in synapse; do
# for plugin in synapse athena redshift snowflake bigquery duckdb; do
  plugin_ver=${plugin}_ver
  docker buildx build --platform linux/amd64,linux/arm64 \
    --tag xemuliam/dbt:${core_ver}-${plugin}${!plugin_ver} \
    --tag xemuliam/dbt:$(echo $core_ver | cut -d. -f 1,2)-${plugin} \
    --tag xemuliam/dbt:${plugin} \
    --build-arg PLUGINS='core=='${core_ver}','${plugin}'=='${!plugin_ver} \
    --push - < ~/Projects/Docker/dbt/Dockerfile.multistage
done

docker buildx rm -f && docker buildx prune -f
