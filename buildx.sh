      core_ver=1.10.2

   synapse_ver=1.8.2
  redshift_ver=1.9.5
    athena_ver=1.9.4
databricks_ver=1.10.4
 snowflake_ver=1.9.4
  bigquery_ver=1.9.2
    duckdb_ver=1.9.4

# docker login
docker buildx create --use --name mybuilder && \
docker run --pull always --privileged --rm tonistiigi/binfmt --install all
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:master --use
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:buildx-stable-1 --use

# for plugin in synapse redshift snowflake; do
for plugin in synapse redshift athena databricks snowflake bigquery duckdb; do
  plugin_ver=${plugin}_ver
  docker buildx build --platform linux/amd64,linux/arm64 \
    -t xemuliam/dbt:${core_ver}-${plugin}${!plugin_ver} \
    -t xemuliam/dbt:$(echo $core_ver | cut -d. -f 1,2)-${plugin} \
    -t xemuliam/dbt:${plugin} \
    --build-arg PLUGINS='core=='${core_ver}','${plugin}'=='${!plugin_ver} --push - < ~/Projects/Docker/dbt/Dockerfile.multistage.universal
done

docker buildx rm -f && docker buildx prune -f
