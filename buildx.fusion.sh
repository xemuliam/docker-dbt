      ver=v2.0.0-preview.186

docker login

docker buildx create --use --name mybuilder && \
docker run --pull always --privileged --rm tonistiigi/binfmt --install all
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:master --use
# docker buildx create --name mybuilder --driver-opt image=moby/buildkit:buildx-stable-1 --use

docker buildx build --platform linux/amd64,linux/arm64 \
  --tag xemuliam/dbt:${ver:1}-fusion \
  --tag xemuliam/dbt:$(echo ${ver:1} | cut -d. -f 1,2)-fusion \
  --tag xemuliam/dbt:fusion \
  --push - < ~/Projects/Docker/dbt/Dockerfile.fusion

docker buildx rm -f && docker buildx prune -f
